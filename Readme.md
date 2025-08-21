# 🛒 E-Commerce MERN Stack Application

<div align="center">

![Build Status](https://img.shields.io/badge/build-passing-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=for-the-badge&logo=docker)
![Jenkins](https://img.shields.io/badge/Jenkins-CI/CD-red?style=for-the-badge&logo=jenkins)
![MongoDB](https://img.shields.io/badge/DB-MongoDB-green?style=for-the-badge&logo=mongodb)
![React](https://img.shields.io/badge/React-18.2.0-blue?style=for-the-badge&logo=react)
![Node.js](https://img.shields.io/badge/Node.js-Express-green?style=for-the-badge&logo=node.js)
![AWS](https://img.shields.io/badge/AWS-Terraform-orange?style=for-the-badge&logo=amazon-aws)
![Vite](https://img.shields.io/badge/Vite-5.0.0-purple?style=for-the-badge&logo=vite)

**A production-ready full-stack E-Commerce web application** built with modern technologies and DevOps practices.

[🚀 Live Demo](#) • [📖 Documentation](#) • [🐛 Report Bug](#) • [💡 Request Feature](#)

</div>

---

## 📋 Table of Contents

- [🌟 Overview](#-overview)
- [🚀 Tech Stack](#-tech-stack)
- [✨ Features](#-features)
- [🏗️ Architecture](#️-architecture)
- [📦 Installation](#-installation)
- [🔧 Configuration](#-configuration)
- [🚀 Deployment](#-deployment)
- [📊 API Documentation](#-api-documentation)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## 🌟 Overview

This is a comprehensive **E-Commerce platform** that demonstrates modern web development practices with a focus on scalability, security, and user experience. The application features a complete shopping experience with user authentication, product management, payment processing, and administrative capabilities.

### 🎯 Key Highlights

- **🛒 Complete Shopping Experience** - Browse, cart, checkout, and order tracking
- **🔐 Secure Authentication** - JWT-based auth with email verification
- **💳 Payment Integration** - Razorpay payment gateway
- **📱 Responsive Design** - Modern UI with Tailwind CSS
- **🐳 Containerized** - Docker-ready for easy deployment
- **🔄 CI/CD Pipeline** - Automated deployment with Jenkins
- **☁️ Cloud Infrastructure** - AWS deployment with Terraform

---

## 🚀 Tech Stack

### Frontend

![React](https://img.shields.io/badge/React-18.2.0-blue?style=for-the-badge&logo=react)
![Vite](https://img.shields.io/badge/Vite-5.0.0-purple?style=for-the-badge&logo=vite)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-4.0.17-38B2AC?style=for-the-badge&logo=tailwind-css)
![Framer Motion](https://img.shields.io/badge/Framer_Motion-12.6.3-black?style=for-the-badge&logo=framer)
![Chart.js](https://img.shields.io/badge/Chart.js-4.4.8-FF6384?style=for-the-badge&logo=chart.js)

### Backend

![Node.js](https://img.shields.io/badge/Node.js-Express-green?style=for-the-badge&logo=node.js)
![MongoDB](https://img.shields.io/badge/MongoDB-8.13.1-green?style=for-the-badge&logo=mongodb)
![JWT](https://img.shields.io/badge/JWT-Authentication-black?style=for-the-badge&logo=json-web-tokens)
![Nodemailer](https://img.shields.io/badge/Nodemailer-Email-orange?style=for-the-badge&logo=mail.ru)

### DevOps & Infrastructure

![Docker](https://img.shields.io/badge/Docker-Container-blue?style=for-the-badge&logo=docker)
![Jenkins](https://img.shields.io/badge/Jenkins-CI/CD-red?style=for-the-badge&logo=jenkins)
![AWS](https://img.shields.io/badge/AWS-EC2-orange?style=for-the-badge&logo=amazon-aws)
![Terraform](https://img.shields.io/badge/Terraform-Infrastructure-purple?style=for-the-badge&logo=terraform)
![NGINX](https://img.shields.io/badge/NGINX-Web_Server-green?style=for-the-badge&logo=nginx)

### Payment & Services

![Razorpay](https://img.shields.io/badge/Razorpay-Payment_Gateway-blue?style=for-the-badge&logo=razorpay)

---

## ✨ Features

### 👤 User Features

- 🔐 **Secure Authentication** - JWT-based login/register with email verification
- 📧 **Email Services** - Password reset and account verification
- 🛍️ **Product Browsing** - Advanced filtering, search, and categorization
- 🛒 **Shopping Cart** - Add/remove items with quantity management
- ❤️ **Wishlist** - Save favorite products for later
- 💳 **Secure Payments** - Integrated Razorpay payment gateway
- 📦 **Order Management** - Track orders and view order history
- 📱 **Responsive Design** - Works seamlessly on all devices

### 👨‍💼 Admin Features

- 📊 **Dashboard Analytics** - Sales statistics and performance metrics
- 📦 **Product Management** - CRUD operations for products
- 📋 **Order Management** - View and manage customer orders
- 👥 **User Management** - Manage user accounts and roles
- 📈 **Sales Reports** - Detailed analytics and reporting
- 🎨 **Content Management** - Update product information and images

### 🔧 DevOps Features

- 🐳 **Docker Containerization** - Easy deployment and scaling
- 🔄 **Jenkins CI/CD** - Automated build and deployment pipeline
- ☁️ **AWS Infrastructure** - Scalable cloud deployment
- 🔧 **Terraform IaC** - Infrastructure as Code
- 🌐 **NGINX Reverse Proxy** - Load balancing and SSL termination
- 🔐 **Environment Security** - Secure configuration management

---

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │   Backend       │    │   Database      │
│   (React + Vite)│◄──►│   (Node.js +    │◄──►│   (MongoDB)     │
│   Port: 3000    │    │    Express)     │    │                 │
│                 │    │   Port: 5000    │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   NGINX Proxy   │    │   Razorpay      │    │   AWS EC2       │
│   (Load Balancer)│    │   (Payments)    │    │   (Infrastructure)│
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 📦 Installation

### Prerequisites

- Node.js (v18 or higher)
- Docker and Docker Compose
- MongoDB Atlas account
- Razorpay account
- AWS account (for deployment)

### 🚀 Quick Start with Docker

1. **Clone the repository**

   ```bash
   git clone https://github.com/harshavardana-reddy/CD_PROJECT.git
   cd CD_PROJECT
   ```

2. **Set up environment variables**

   ```bash
   # Create .env files for backend and frontend
   cp backendapp/.env.example backendapp/.env
   cp frontendapp/.env.example frontendapp/.env
   ```

3. **Run with Docker Compose**

   ```bash
   docker-compose up --build
   ```

4. **Access the application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:5000

### 🔧 Manual Installation

#### Backend Setup

```bash
cd backendapp
npm install
npm start
```

#### Frontend Setup

```bash
cd frontendapp
npm install
npm run dev
```

---

## 🔧 Configuration

### Environment Variables

#### Backend (.env)

```env
PORT=5000
DB_URI_ATLAS=mongodb+srv://username:password@cluster.mongodb.net/ecomdb
RAZORPAY_KEY_ID=your_razorpay_key_id
RAZORPAY_KEY_SECRET=your_razorpay_secret
JWT_SECRET_KEY=your_jwt_secret
```

#### Frontend (.env)

```env
VITE_APP_RAZORPAY_KEY=your_razorpay_key_id
VITE_APP_BACKEND_URL=http://localhost:5000
```

---

## 🚀 Deployment

### 🐳 Docker Deployment

```bash
# Build and run containers
docker-compose up --build -d

# View logs
docker-compose logs -f
```

### ☁️ AWS Deployment with Jenkins

1. **Set up Jenkins credentials**

   - AWS credentials
   - SSH key for EC2
   - Environment variables

2. **Run Jenkins pipeline**

   ```bash
   # Pipeline automatically:
   # - Initializes Terraform
   # - Creates AWS infrastructure
   # - Deploys application
   # - Sets up NGINX proxy
   ```

3. **Access deployed application**
   - Application will be available at the EC2 public IP
   - Ports: 80 (HTTP), 3000 (Frontend), 5000 (Backend)

### 🔧 Manual AWS Deployment

1. **Launch EC2 instance**
2. **Install Docker and Docker Compose**
3. **Clone repository and configure**
4. **Run docker-compose up -d**

---

## 📊 API Documentation

### Authentication Endpoints

- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/verify-email` - Email verification
- `POST /api/auth/forgot-password` - Password reset

### Product Endpoints

- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get product by ID
- `POST /api/products` - Create product (Admin)
- `PUT /api/products/:id` - Update product (Admin)
- `DELETE /api/products/:id` - Delete product (Admin)

### Order Endpoints

- `POST /api/orders` - Create order
- `GET /api/orders` - Get user orders
- `GET /api/orders/:id` - Get order details
- `PUT /api/orders/:id/status` - Update order status (Admin)

### Payment Endpoints

- `POST /api/payments/create-order` - Create Razorpay order
- `POST /api/payments/verify` - Verify payment

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add amazing feature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open a Pull Request**

### 📝 Development Guidelines

- Follow ESLint configuration
- Write meaningful commit messages
- Test your changes thoroughly
- Update documentation if needed

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**P. Harshavardana Reddy**

- GitHub: [@harshavardana-reddy](https://github.com/harshavardana-reddy)
- LinkedIn: [Your LinkedIn]
- Email: [Your Email]

---

## 🙏 Acknowledgments

- [React](https://reactjs.org/) - Frontend framework
- [Node.js](https://nodejs.org/) - Backend runtime
- [MongoDB](https://www.mongodb.com/) - Database
- [Docker](https://www.docker.com/) - Containerization
- [Jenkins](https://jenkins.io/) - CI/CD
- [AWS](https://aws.amazon.com/) - Cloud infrastructure
- [Razorpay](https://razorpay.com/) - Payment gateway

---

<div align="center">

⭐ **Star this repository if you found it helpful!** ⭐

[![GitHub stars](https://img.shields.io/github/stars/harshavardana-reddy/CD_PROJECT?style=social)](https://github.com/harshavardana-reddy/CD_PROJECT/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/harshavardana-reddy/CD_PROJECT?style=social)](https://github.com/harshavardana-reddy/CD_PROJECT/network)
[![GitHub issues](https://img.shields.io/github/issues/harshavardana-reddy/CD_PROJECT)](https://github.com/harshavardana-reddy/CD_PROJECT/issues)

</div>
