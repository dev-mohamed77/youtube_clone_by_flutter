// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_clone/core/utils/manager/app_navigator_manager.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_bloc/home_event.dart';

import '../../../../../core/utils/manager/app_dialog_manager.dart';
import '../../blocs/add_video_bloc/add_video_bloc.dart';
import '../../blocs/add_video_bloc/add_video_event.dart';
import '../../blocs/add_video_bloc/add_video_state.dart';
import '../../blocs/home_bloc/home_state.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  void initState() {
    super.initState();
    _showDialog();
  }

  void _showDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AppDialogManager.showModalBottomSheetApp(
          context,
          ListTile(
            onTap: () {
              context.read<AddVideoBloc>().add(AddVideoEvent());
            },
            leading: const Icon(Icons.upload),
            title: const Text("Upload Video"),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: BlocBuilder<AddVideoBloc, AddVideoState>(
        builder: (context, state) {
          return Center(
            child: state.chewieController != null
                ? Column(
                    children: [
                      Expanded(
                        child: Chewie(
                          controller: state.chewieController!,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Drag to adjust video",
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              AppNavigatorManager.navigatorPush(
                                context,
                                AddVideoDetailsPage(
                                  video: state.videoFile!,
                                ),
                              );
                            },
                            child: const Text("Next"),
                          ),
                        ],
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}

class AddVideoDetailsPage extends StatefulWidget {
  const AddVideoDetailsPage({
    Key? key,
    required this.video,
  }) : super(key: key);
  final File video;

  @override
  State<AddVideoDetailsPage> createState() => _AddVideoDetailsPageState();
}

class _AddVideoDetailsPageState extends State<AddVideoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      _titleController.dispose();
      _descriptionController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(HomeAddVideoEvent(
                      videoFile: widget.video,
                      title: _titleController.text,
                      description: _descriptionController.text,
                    ));
              },
              child: const Text("UploadVideo"),
            ),
          ),
        ],
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeAddVideoSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message.result),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is HomeAddVideoError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.err),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Title",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextField(
                minLines: 1,
                maxLines: 5,
                style: Theme.of(context).textTheme.titleLarge,
                controller: _titleController,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: "Create a title (type @ to mention a channel)",
                ),
              ),
              const Divider(),
              Builder(builder: (context) {
                return ListTile(
                  onTap: () {
                    AppNavigatorManager.navigatorPush(
                        context,
                        AddDescription(
                          descriptionController: _descriptionController,
                        ));
                  },
                  title: _descriptionController.text.isEmpty
                      ? const Text(
                          "Add description",
                        )
                      : Text(
                          _descriptionController.text,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                  leading: const Icon(Icons.menu),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class AddDescription extends StatelessWidget {
  const AddDescription({
    Key? key,
    required this.descriptionController,
  }) : super(key: key);
  final TextEditingController descriptionController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextField(
        minLines: 1,
        maxLines: 15,
        style: Theme.of(context).textTheme.titleMedium,
        controller: descriptionController,
        maxLength: 5000,
        decoration: const InputDecoration(
          hintText: "Add description (type @ to mention a channel)",
        ),
      ),
    );
  }
}
