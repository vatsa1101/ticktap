# TickTap

TickTap is a Flutter app that provides a fun and interactive way to engage users by generating random numbers and challenging them to match the seconds part of the current timestamp. The app incorporates FlutterBloc for state management and Hive for efficient data storage and retrieval.

## How to run the app

- Ensure you have the latest stable version of Flutter installed.
- Clone the repository to your local machine.
- Open the project in your preferred Flutter IDE.
- Run the app on an emulator or physical device.

### Features

Interaction:

- Generate button is triggers the generation of a random number between 0 and 59.

Success Message:

- If the random number in matches the seconds part of the current timestamp, a success message is displayed.
- If there is no match, the user is prompted to try again.

Success Count:

- The total number of successful attempts since the user installed the app is displayed on top.
- Success count is stored and retrieved using Hive for persistent data.
