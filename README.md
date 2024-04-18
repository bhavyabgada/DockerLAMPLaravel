
# Docker-Based Laravel Application

This guide covers the deployment of a Docker-based Laravel application on a DigitalOcean droplet. It includes setting up a non-root user, installing Docker, and configuring the application.

## Prerequisites

- A DigitalOcean droplet
- Root access to the droplet

## Getting Started

### Step 1: Initial Droplet Setup

SSH into your DigitalOcean droplet as the root user:

```bash
ssh root@<DROPLET-URL>
```

### Step 2: Create a Non-Root User

Create a new user called `laravel` and grant them sudo privileges:

```bash
adduser laravel
usermod -aG sudo laravel
exit
```

Reconnect to the droplet with the new user:

```bash
ssh laravel@<DROPLET-URL>
```

### Step 3: Clone the Repository

Navigate to the home directory and clone the project repository:

```bash
cd /home/laravel
git clone https://github.com/bhavyabgada/DockerLAMPLaravel.git
```

### Step 4: Install Docker

Update your package list and install required packages:

```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce
```

Verify that Docker is installed correctly:

```bash
sudo systemctl status docker
```

### Step 5: Install Docker Compose

Install Docker Compose:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### Step 6: Configure Docker Permissions

Add the `laravel` user to the Docker group to manage Docker as a non-root user:

```bash
sudo usermod -aG docker laravel
exit
```

Reconnect to the droplet to refresh your group membership:

```bash
ssh laravel@<DROPLET-URL>
cd /home/laravel/DockerLAMPLaravel/
```

### Step 7: Application Setup

Navigate to the application source directory:

```bash
cd src/
sudo cp .env.example .env
```

Build and start the Docker containers:

```bash
sudo docker compose build && sudo docker-compose up -d
```

### Step 8: Install Dependencies

Install Composer dependencies:

```bash
docker-compose run --rm composer install
```

### Step 9: Set Permissions

Set the necessary permissions for the Laravel storage directory:

```bash
sudo chmod o+w ./storage/ -R
sudo chown www-data:www-data -R ./storage
```

### Step 10: Run Migrations

Execute database migrations and seed the database:

```bash
docker-compose run --rm artisan migrate --seed
```

## How to Use the Application

### Accessing the Application

After deploying the application and starting the Docker containers, the application should be accessible via your DigitalOcean droplet's IP address:

```
http://<DROPLET-IP>
```

### Initial View

Upon accessing the application, you will be presented with portal to enter user details. If you do not yet have an account, you need to register.

#### Registration

1. Click on the **Register** link to navigate to the registration form.
2. You will see a form with four input boxes where you can enter user data:
   - **Name** - Enter your full name.
   - **Email Address** - Enter a valid email address that will be used to log in.
   - **Password** - Provide a password for the account.
   - **Confirm Password** - Repeat the password for confirmation.
3. After filling out the form, click on the **Register** button to create your account.

### Logging In

1. Return to the main page by clicking the **Login** link.
2. Enter your email address and password that you registered with.
3. Click the **Login** button to access the user portal.

### User Portal

Once logged in, you will be directed to the user portal. Here, you can manage user accounts if you have the necessary permissions.

#### Managing Users

- **Activate User**: To activate a user account, navigate to the user management section, and click on the **Activate** button beside the user's name.
- **Deactivate User**: Similarly, to deactivate a user account, click on the **Deactivate** button beside the user's name.

These options allow administrative users to manage account statuses effectively.

### Troubleshooting

If you encounter issues with logging in or managing users, ensure the Docker containers are running properly and the database migrations were executed correctly as detailed in the installation steps.

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Your Name**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details