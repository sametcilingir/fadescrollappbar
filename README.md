
# Fade Scroll App Bar

With this package, you can create a large appbar and make a smooth fade effect by swiping.

## Features

![App Screenshot 0](https://media.giphy.com/media/CO3BUMI5iMZaJoFwzJ/giphy.gif)
![App Screenshot 1](https://media.giphy.com/media/JG3tCaczuslaDRLoY0/giphy.gif)
![App Screenshot 2](https://media.giphy.com/media/v3QRwYr54KZ16A97Uq/giphy.gif)

## Usage
First you should create ScrollController.
```dart
  final ScrollController _scrollController = ScrollController();

```

And adding in it.

```dart
FadeScrollAppBar(
        scrollController: _scrollController,
        appBarLeading: Icon(Icons.flutter_dash_outlined),
        appBarTitle: Text('Cool App Bar'),
        appBarForegroundColor: Colors.amber,
        pinned: true,
        fadeOffset: 120,
        expandedHeight: 250,
        backgroundColor: Colors.white,
        fadeWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Really Good App Bar",
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Colors.black,
                    )),
          ],
        ),
        bottomWidgetHeight: 40,
        bottomWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chip(
              label: Text("Great"),
              backgroundColor: Colors.amber,
              side: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
            SizedBox(width: 10),
            Chip(
              label: Text("App Bar"),
              backgroundColor: Colors.amber,
              side: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 300,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
```


