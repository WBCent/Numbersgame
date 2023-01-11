import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

void main() => runApp(const MyApp()); //In the Flutter framework, void main() is the entry point for a Flutter app. It is the first function that is executed when the app starts running. The main() function is where you define the root Widget for the app and run the runApp() method with it to initialize the app. In the context of a Flutter app, the root widget refers to the top-most widget in the widget tree. The widget tree is a hierarchy of widgets that make up the user interface of the app. The root widget is the parent of all other widgets in the app and occupies the entire screen.

//In the example main() function that I provided earlier, MyApp is the root widget because it is the top-most widget in the widget tree. It is passed to the runApp() method, which initializes the app and inserts the root widget into the widget tree. All other widgets in the app are descendants of the root widget.

//The root widget is important because it serves as the starting point for building the user interface of the app. It defines the overall structure and layout of the app, and sets the visual theme and other properties that are inherited by its descendants.

//The runApp() function does the following:
//Creates a WidgetsApp object, which is the root of the widget tree.
// Initializes the app with the WidgetsApp object and the root widget.
// Calls the build() method on the root widget to build the widget tree.
// Inserts the widget tree into the app's rendering tree, which is used to display the widgets on the screen.

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //This syntax is defining a constructor for a class called MyApp, which takes a named parameter key. This key parameter is passed to the parent class's constructor using the super keyword.
  @override
// In the Flutter framework, the @override annotation is used to indicate that a method is overriding a method with the same name and signature in a parent class. When you override a method, you are providing a new implementation for it that is specific to the subclass.

// The @override annotation is optional, but it is a good practice to use it because it helps to catch errors at compile time. If you forget to use the @override annotation and you are not actually overriding a method in the parent class, the compiler will generate an error. This can help to prevent subtle bugs that can be difficult to track down.

//The MyApp class extends the stateless eiwdget class, which means that it as a subclass of stateless widget has access to all of its methods and properties.

//The MyApp class overrides the build method which is a method that is defined in teh stateless widget class and is used to build the widget tree for the app, when teh build method is called, the implementation in the myApp class is used instead of the implementation in the stateless widget class

//the override annotation is used to indicate the build method is being overriden.

  Widget build(BuildContext context){
  // In the flutter framework buildContext is a build time type that represents the location of a widget in the widget tree. It is passed as an argument to the build method of a widget and it can be used to access the parent widget ancestors and descendants of widgets. The build context object is a handle to the location of a widget in the widget tree and it is used to build the widget tree. It is not a widget itself but it is used to create widgets.

  //context effectively just allows you to acces further up the widget tree. To access the theme from a descedant widget for example, you need a way to navigate up the widget tree to the root material app widget. BuildContext is a handle to the location of a widget in the widget tree and it can be used to navigate up the tree to find the ancestor widgets. In this case, the context object is used to locate Theme of the app, which is defined in the ancestor materialApp widget.

  //Using the context object to access the Theme of the app is a good practice because it allows you to access the Theme from anywhere in the app, without having to pass it down the widget tree manually as a prop. It also allows you to change the Theme in the root MaterialApp widget and have the changes be propagated automatically to all descendant widgets that use the Theme.
  const appTitle = 'Numbers Demo'; //the final keyword is used to declare a variable that cannot be reassigned. A final variable must be initialized when it is declared, and it cannot be changed afterwards.
  return MaterialApp( //MaterialApp is a widget that is used to build a Material Design app. It provides a number of features that are useful for building Material Design apps, such as a visual theme, localization, and routing.
    title: appTitle,
    home: Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const MyCustomForm(),
    ),
  );
}
}

class MyCustomForm extends StatefulWidget{
  const MyCustomForm({super.key});
  @override
  MyCustomFormState createState() => MyCustomFormState();
  //In Flutter, the StatefulWidget class is used to create widgets that have mutable state. When you create an instance of a StatefulWidget, the framework creates a corresponding State object to manage the widget's state. The createState method is used to create this State object.

    //In the Flutter framework, createState() is a method that is defined in the StatefulWidget class and is used to create the State for a StatefulWidget.
    //The State of a StatefulWidget is a class that is used to hold the mutable state of the widget and to rebuild the widget when its state changes. The State class is typically defined as a separate class that extends the State class.
    //The createState() method is called by the Flutter framework when it needs to create the State for a StatefulWidget. It returns an instance of the State class that is associated with the StatefulWidget.

    // When you create a StatefulWidget, you are creating a widget that has a mutable state, which means that its properties can change over time. However, the StatefulWidget itself is immutable, which means that it cannot be modified once it is created.

    // To manage the mutable state of a StatefulWidget, you need to create a separate State class that holds the mutable state and defines the methods that are used to update the state. The State class is typically defined as a separate class that extends the State class and is associated with the StatefulWidget.

    // The createState() method is used to create an instance of the State class for a StatefulWidget. It is called by the Flutter framework when it needs to create the State for the StatefulWidget.

    // The reason for separating the mutable state from the StatefulWidget is to allow the Flutter framework to optimize the performance of the app. Because the StatefulWidget is immutable, the Flutter framework can cache it and avoid rebuilding it when its state changes. Only the State class, which holds the mutable state, needs to be rebuilt when the state changes. This can improve the performance of the app, especially in cases where the StatefulWidget has a complex user interface.
}

//Create a Corresponding State class which holds data related to the form:

class MyCustomFormState extends State<MyCustomForm>{
  //create a global key that uniquely identifies the form and allows for validation of the form:
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //Build a form widget using the _formKey created above
    var _selectedOption;
    return Container(
      child: LayoutGrid(
        columnSizes: [20.fr, 20.fr, 50.fr],
        rowSizes: [23.fr, 23.fr, 23.fr, 23.fr],
        columnGap: 5,
        rowGap: 2,
        children: [
        Form(
              key: _formKey,      
              child: GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
              //25 25 50
              //the child property of form is used to specify the widget that is displayed as a child of the form; The column widget is used to create a vertical layout, where the children are arranged in a top to bottom flow
              //child vs Children in Flutter: In Flutter, the child property is used to specify a single widget that is displayed as a child of the parent widget. The children property, on the other hand, is used to specify a list of widgets that are displayed as children of the parent widget.
                  TextFormField(  
                      decoration: const InputDecoration( 
                        labelText: 'Target',
                        hintText: 'What is the Target Number',  
                      ),  
                    ),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('Solve'),
                    ),
                  TextFormField(
                      decoration: const InputDecoration( 
                        labelText: 'Numbers',
                        hintText: 'What are the Numbers you want to use to create the Number',  
                      ),
                  ),
                      RadioListTile(
                        title: const Text('Exact Solution'),
                        value: 1,
                        groupValue: _selectedOption, 
                        onChanged: (value) { 
                          setState(() { //In Flutter, the setState function is used to mark the widget tree as "dirty" and requiring a rebuild, so that the framework can redraw the widget with the new state. This is typically used when the internal state of a widget changes, and the change needs to be reflected in the user interface.
                            _selectedOption = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('All Lengths'),
                        value: 2,
                        groupValue: _selectedOption, 
                        onChanged: (value) { 
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('Knapsack (+ only)'),
                        value: 3,
                        groupValue: _selectedOption, 
                        onChanged: (value) { 
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('First Solution Only'),
                        value: 4,
                        groupValue: _selectedOption, 
                        onChanged: (value) { 
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                      ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('Interrupt'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('Generate'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('About'),
                    ),
                    TextField(
                        decoration: const InputDecoration(
                          labelText: 'Result',
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        onChanged: (value) {
                          setState(() {
                          });
                        },
                        controller: TextEditingController(text: 'result'),
                      )
              ]
              
            )
          ),
        ],
      )
    );
}
}
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      