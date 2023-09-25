# Dockerized Django Azure Web App

🍪❤️ A Fresh Take on Cookiecutter Django 🍪❤️

Cookiecutter-Dockerized-Django-Azure-Web-App allows you to kickstart production-ready Django projects rapidly, all thanks to the magic of Cookiecutter. It draws significant inspiration from [cookiecutter-django](https://github.com/cookiecutter/cookiecutter-django).

If you encounter issues with Cookiecutter Django, please don't hesitate to [open an issue](https://github.com/Painkiller995/Cookiecutter-Dockerized-Django-Azure-Web-App/issues).

## Features

- Django 4.2 at the forefront 🎭
- Powered by the enchantment of Python 3.11 🐍✨
- Adheres to the 12-Factor app principles using `django-environ` ⚙️
- Embraces a security-first approach with SSL 🛡️
- Fine-tuned settings for both development and production environments 🛠️
- Flexibility galore: Customize your PostgreSQL version 🐘
- Redis cache integration
- Optional static file serving via Whitenoise 🌐
- Optional Celery support for background tasks 🌸

## Usage

1. Install Cookiecutter (if not already installed):

   ```bash
   pip install "cookiecutter>=1.7.0"
   ```

2. Generate your project using Cookiecutter-Dockerized-Django-Azure-Web-App:

   ```bash
   cookiecutter https://github.com/Painkiller995/Cookiecutter-Dockerized-Django-Azure-Web-App
   ```

3. Follow the prompts to provide your project details.

4. After generating the project, navigate to the project directory:

   ```bash
   cd yourprojectname/
   ```

5. Initialize a Git repository, add your code, and push to your chosen remote:

   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin git@github.com:yourusername/yourprojectname.git
   git push -u origin main
   ```

For instructions on local development and deployment, please refer to:

- [Developing Locally using Docker](https://cookiecutter-django.readthedocs.io/en/latest/developing-locally-docker.html) (based on django-cookiecutter documentation)

## Production Development

- Install the Azure CLI.
  - Ensure you have logged in and selected your subscription in the Azure CLI.
- In your project, you will find a folder called `.deploy_on_azure`. Using a bash terminal, such as Git Bash in VSCode, you can execute the files one by one. Each file is named in a way that helps you understand its purpose.
- If you prefer not to use the PostgreSQL database, you can skip the database setup and remove the corresponding environment variables from your project. Configure your desired database instead.
- Note that virtual network integration is not supported with multi-container (Docker Compose) apps. So, your database server should allow public IPs, or you will not be able to connect to the database.
- Celery Beat throws errors due to missing tables in the database, causing your deployment to restart, you can resolve this by running migrations via SSH. After that, restart your app to ensure stability.

Note: If you find it difficult to run `python /app/manage.py migrate` in SSH while the web app keeps restarting, you can either remove the Celery Beat container, perform the migration, and then reuse it, or add the migration to the startup script temporarily and remove it later before repushing. Another option is to remove celery beatconfig from settings and re-add it.

To use continuous deployment, you need to activate it in the deployment center. After that, you can use the bash file `8-continuous-deployment.sh` each time you make changes.

## License 📄

This project is governed by the terms and conditions specified in the [License](LICENSE) file.
