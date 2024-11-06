# Calculator App

A simple and elegant calculator built using Flutter. This app allows users to perform basic arithmetic operations such as addition, subtraction, multiplication, and division. It features a clean, user-friendly interface designed for mobile devices.

## Features

- **Basic Operations**: Addition, subtraction, multiplication, and division.
- **Clear All**: Reset the calculator with the "AC" button.
- **Percentage**: Calculate percentages with the `%` button.
- **Decimal Support**: Handles decimals and displays results accordingly.
- **Negative Numbers**: Toggle between positive and negative numbers using the "+/-" button.

## Screenshots

(Insert screenshot of the calculator UI here)

## Project Structure

- **`main.dart`**: The entry point of the app, runs the `MyApp` widget.
- **`calculator.dart`**: Contains the UI and button interaction logic for the calculator.
- **`calculation.dart`**: The model responsible for performing calculations and maintaining the app's state (numbers, result, etc.).

### Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/calculator-app.git

2. **Navigate into the project directory**:
   ```bash
   cd calculator-app

3. **Install dependencies**:
   ```bash
   flutter pub get

4. **Run the app**:
   ```bash
   flutter run

## How it Works

1. **User Interaction**: 
   - Users interact with the calculator's buttons to input numbers and operations.
   - Each button press calls the `calculation()` function from `calculation.dart` which processes the operation.
   
2. **Calculation Logic**:
   - `calculation.dart` handles the core functionality of the calculator, including performing arithmetic operations and maintaining the current result.

3. **UI Updates**:
   - The `Calculator` widget in `calculator.dart` listens for updates and reflects the changes in the UI using the `setState()` function.

## Contributing

Feel free to fork this project, open issues, and submit pull requests! Contributions are welcome.

1. **Fork the repository**
2. **Create a new branch** (`git checkout -b feature-branch`)
3. **Make changes and commit them** (`git commit -am 'Add new feature'`)
4. **Push to the branch** (`git push origin feature-branch`)
5. **Create a new pull request**

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Flutter SDK and Dart programming language.
- Inspiration for the design and functionality was taken from standard calculator apps.
