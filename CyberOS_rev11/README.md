# CyberOS Project

CyberOS is a Django-based application designed for managing service orders efficiently. This project provides a user-friendly interface for creating, editing, and tracking service orders, along with managing clients and equipment.

## Project Structure

The project is organized as follows:

```
CyberOS_rev11/
├── manage.py               # Command-line utility for managing the Django project
├── requirements.txt        # Lists the Python packages required for the project
├── .env                    # Contains environment variables for the project
├── .gitignore              # Specifies files and directories to be ignored by Git
├── cyberos/                # Main application directory
│   ├── __init__.py        # Indicates that the directory is a Python package
│   ├── settings.py        # Contains project settings and configurations
│   ├── urls.py            # Defines URL patterns for the project
│   ├── wsgi.py            # Entry point for WSGI-compatible web servers
│   └── asgi.py            # Entry point for ASGI-compatible web servers
├── ordens/                 # Application for managing service orders
│   ├── migrations/         # Directory for database migrations
│   │   └── __init__.py    # Indicates that the migrations directory is a Python package
│   ├── templates/          # Contains HTML templates for the application
│   │   └── ordens/
│   │       ├── editar_ordem.html  # Template for editing service orders
│   │       └── base_ordens.html    # Base template for service order-related pages
│   ├── static/             # Contains static files (CSS, JS)
│   │   └── ordens/
│   │       ├── css/
│   │       │   └── editar_ordem.css # CSS styles for the editar_ordem.html template
│   │       └── js/
│   │           └── editar_ordem.js   # JavaScript functionality for the editar_ordem.html template
│   ├── admin.py            # Registers models with the Django admin site
│   ├── apps.py             # Configuration for the ordens app
│   ├── models.py           # Defines data models for the ordens app
│   ├── views.py            # Contains view functions for handling requests
│   ├── urls.py             # Defines URL patterns specific to the ordens app
│   ├── forms.py            # Contains form classes for handling user input
│   ├── serializers.py       # Serializers for converting complex data types to and from JSON
│   └── tests.py            # Test cases for the ordens app
└── templates/              # Contains base templates for the project
    └── base.html           # Base template for the entire project
```

## Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   cd CyberOS_rev11
   ```

2. Create a virtual environment:
   ```
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. Install the required packages:
   ```
   pip install -r requirements.txt
   ```

4. Set up environment variables in the `.env` file.

5. Run database migrations:
   ```
   python manage.py migrate
   ```

6. Start the development server:
   ```
   python manage.py runserver
   ```

## Usage

- Access the application at `http://127.0.0.1:8000/`.
- Use the provided interface to manage service orders, clients, and equipment.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.