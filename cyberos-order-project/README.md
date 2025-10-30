# CyberOS Order Project

## Overview
The CyberOS Order Project is a web application designed to manage service orders efficiently. It consists of a backend built with Django and a frontend developed using React. This project aims to streamline the process of creating, editing, and tracking service orders.

## Project Structure
The project is divided into two main parts: the backend and the frontend.

### Backend
- **manage.py**: A command-line utility for administrative tasks.
- **requirements.txt**: Lists the Python packages required for the project.
- **.env.example**: Example environment variables for configuration.
- **Dockerfile**: Instructions for building a Docker image for the backend.
- **cyberos_project/**: Contains the main Django project files.
  - **settings.py**: Configuration settings for the Django project.
  - **urls.py**: URL routing for the Django application.
  - **asgi.py** and **wsgi.py**: Entry points for ASGI and WSGI servers.
- **ordens/**: The Django app responsible for managing service orders.
  - **templates/**: Contains HTML templates for rendering views.
  - **static/**: Contains static files such as CSS and JavaScript.
  - **models.py**: Defines the data models for the application.
  - **views.py**: Contains the logic for handling requests and responses.
  - **urls.py**: URL routing specific to the ordens app.

### Frontend
- **package.json**: Contains metadata about the project and its dependencies.
- **tsconfig.json**: TypeScript configuration file.
- **public/**: Contains static files for the frontend.
  - **index.html**: The main HTML file for the React application.
- **src/**: Contains the source code for the React application.
  - **index.tsx**: Entry point for the React application.
  - **App.tsx**: Main application component.
  - **api/**: Contains API-related functions for interacting with the backend.
  - **components/**: Contains reusable React components.
  - **styles/**: Contains CSS files for styling the application.

## Getting Started
To get started with the CyberOS Order Project, follow these steps:

1. **Clone the repository**:
   ```
   git clone <repository-url>
   cd cyberos-order-project
   ```

2. **Set up the backend**:
   - Navigate to the `backend` directory.
   - Create a virtual environment and activate it.
   - Install the required packages:
     ```
     pip install -r requirements.txt
     ```
   - Set up the database and run migrations:
     ```
     python manage.py migrate
     ```

3. **Run the backend server**:
   ```
   python manage.py runserver
   ```

4. **Set up the frontend**:
   - Navigate to the `frontend` directory.
   - Install the frontend dependencies:
     ```
     npm install
     ```
   - Start the frontend development server:
     ```
     npm start
     ```

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.