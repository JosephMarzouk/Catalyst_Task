import 'package:catalyst_technical_task/DefultView.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/models/properties_model/properties_model.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/Widgets/VideoPlayer.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/manager/cubit/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyDetails extends StatelessWidget {
  final PropertiesModel property;

  const PropertyDetails({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = property.images ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(property.name ?? 'Property Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Name and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    property.name ?? 'No name provided',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '\$${property.price} / night',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 16),

            Text(
              property.location ?? 'No location provided',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),

            if (images.isNotEmpty)
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text('Image not available'),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            else
              const Center(
                child: Text(
                  'Image not available',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              property.description ?? 'No description available',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Property Owner Information
            const Text(
              'Owner Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ClipOval(
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(property.user?.profileImage ?? 'https://via.placeholder.com/150'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.user?.name ?? 'No name provided',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      property.user?.email ?? 'No email provided',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      property.user?.phone ?? 'No phone number provided',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            if (property.video != null && property.video!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Video:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Opening video link...'),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(
                              videoUrl: 'https://your-video-url.com/video.mp4'),
                        ),
                      );
                    },
                    child: Text(
                      property.video!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Delete User'),
                              content: const Text(
                                  'Are you sure you want to delete this user?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    BlocProvider.of<PropertiesCubit>(context)
                                        .deleteProperty(
                                      id: property.id.toString(),
                                    );
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DefultView()));
                                  },
                                  child: const Text('Delete User'),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text('Delete User'),
                  ),
                ),
              
          ],
        ),
      ),
    );
  }
}
