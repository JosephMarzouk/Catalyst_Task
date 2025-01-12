
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/Views/PropertyDetails.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Presentation/Widgets/CustomDots.dart';
import 'package:flutter/material.dart';
import 'package:catalyst_technical_task/Features/Display_Edit_Create_Properties/Data/models/properties_model/properties_model.dart';

class PropertyCard extends StatefulWidget {
  final PropertiesModel property;

  const PropertyCard({Key? key, required this.property}) : super(key: key);

  @override
  _PropertyCardState createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = widget.property.images ?? [];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetails(property: widget.property),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.property.name ?? 'No name provided',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '\$${widget.property.price} / night',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              
              Text(
                widget.property.location ?? 'No location provided',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),

              
              if (images.isNotEmpty)
                Column(
                  children: [
                    SizedBox(
                      height: 150,
                      child: PageView.builder(
                        controller: pageController,
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
                    ),
                    const SizedBox(height: 10),
                    DotsIndecator(
                      currentIndex: currentIndex,
                      totalCount: images.length,),
                  ],
                )
              else
                const Center(
                  child: Text(
                    'Image not available',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              const SizedBox(height: 10),

              
              Text(
                widget.property.description ?? 'No description available',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class DotsIndecator extends StatelessWidget {
  final int currentIndex;
  final int totalCount;

  const DotsIndecator({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalCount,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 6),
          child: CustomDot(
            isActive: index == currentIndex,
          ),
        ),
      ),
    );
  }
}
