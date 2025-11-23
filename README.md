# event_details

In this project you are able to view a list of events by Elevation Church in a scrollable list.
In this list you will have the ability to favorite and select each event. When selecting an event you will be able to
view the events details on a detail page. Here you can view details of an event and its favorite status.

## Getting Started

Here are steps needed to get the project running.

1. On Github, download the zip file.

2. Save to your desktop, and extract the zip file.

3. Open the project with VSCode(or desired IDE)

4. Open terminal 
    - ctrl + `

5. Go to correct path by typing
    - cd .\event_details-main\

6. Then insert into terminal
    - flutter pub get

7. Then insert into terminal
    - flutter run
    - select Chrome by inserting the number 2 into terminal
    - for best viewing you web dev tools and change the viewing dimensions to a mobile device

## Questions
(Make sure to view lib folder when reviewing)

1. Why you chose your state management approach.
    - In flutter you have a stateful and stateless widgets. In viewing the project you can see that I used a statefull widget 
    for all components that would always change. For example, in the list component, it is a stateful widget because you would anticipate the list to grow or shrink depending on the amount of events there are.

    - In my event details page it is a stateful widget because the state of wether it has been favorited or not changes depending on parent widget. In theory I suppose it could be a stateless widget if there was no indicator on if the event was favorited or not. I think of a stateless widget being similar to a static web page in that it only displays information and that is it.

    - My event component is one of the only stateless widgets I have because it only returns information of the data in our JSON. There is no state change needed. 

2. How you structured your project and how it could scale.
    - When structuring my projects I tried to use the idea of seperation of concerns. This means seperating main components into
    there own files that way it helps with debugging and scaling. For example if I were to have problems with text styling I can
    go to debug in my style_text.dart file instead of trying to edit all text style seperatly in each file. 

    - Or if favorite button is having bugs regarding color size properties etc. I can debug my favorite.dart file.

    - If I were to scale my project to add more items to the list, and to have detail pages added for every item and favoriting logic to be the same, all I would have to do is add those event details in my JSON file and the rest of the app would expand because no important event data is hard coded into the widget. 

3. Where GraphQL integration would live in a real application.
    - I would change the logic of my factory ElevationEvent.fromJson object in my event_model.dart file to return GraphQL logic and formatting.

    - I would want my GraphQL queries to be in place of where I have my json_transformer.dart file. In the same way that I am using to refactor data I would use this to hold my data using GraphQL and assign queries to it.

    - I believe I should be able to continue calling data from my ElevationEvent like prior. We just changed how the data was vbeing held and reassigned query names. Such as title, category, description, etc.

4. What you would improve with more time.
    - I would add a filtering property to the list that will allow me to filter through what is favorited and not favorited.

    - I would like to add some sorting feature to the list that sorts events by dates or locations.

    - I would like to make the details page less bare, adding images of last years events any graphics and that can also be added to each event on the list page in the same way there are images in the different locations tab on the Elevation App.

5. Any trade-offs or limitations in your implementation.
    - There is a limitation in the styling of the text for the event and details. It can only remain the same unless you hard code different styleing to use or create another styling class. I did make it that not all parameters are needed which was changed after realizing I need more or less paremeters for the details page compared to the event list. 


