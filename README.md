# Pharmacy Billing Management System

## Project Overview

The Pharmacy Billing Management System is a Java-based web application designed to digitize and streamline the billing and management processes in pharmaceutical stores. This project aims to replace the traditional pen-and-paper method with a modern, efficient, and user-friendly system, allowing better service and management of employees, inventory, and billing.

## Features

### Admin Features
- **Login:** Secure access to the system with email and password.
- **Employee Management:** Add, edit, delete, and verify employee details.
- **Inventory Management:** View, edit, and add products to the store’s inventory.
- **Sales Reports:** Visualize sales data through charts for performance analysis.
- **Order History:** View all order histories for auditing purposes.
- **Logout:** Securely exit the system after completing tasks.

### Employee Features
- **Login:** Secure access to the system with email and password.
- **Customer Management:** Add and update customer details.
- **Invoice Generation:** Generate invoices containing order details.
- **Inventory Management:** View, edit, and add new products to the inventory.
- **Order History:** View and print order history.
- **Logout:** Securely exit the system after completing tasks.

## Technologies Implemented

- **Core Java / J2EE:** Backend logic implemented using Java.
- **MySQL & JDBC:** Database management and connection.
- **JSP:** Frontend dynamic web pages.
- **CSS & Bootstrap:** Styling and responsive design.
- **JavaScript & jQuery/Ajax:** Dynamic functionalities and asynchronous data operations.
- **Struts 2:** MVC architecture framework.
- **Rest APIs:** External data fetching (e.g., Aadhaar details, pin code).
- **Java Mail:** Email confirmation for orders.
- **MD5:** User password encryption for enhanced security.

## Project Architecture

- **Frontend:** JSP, CSS, Bootstrap, JavaScript.
- **Backend:** Core Java, Struts 2, JDBC, MySQL.
- **Web Server:** Apache Tomcat.
- **Data Flow:** MVC Architecture using Struts 2.

## Development Practices

- **Service-Oriented Architecture:** Ensures modularity and code reusability.
- **Effective Memory Management:** Singleton classes to manage memory efficiently.
- **Error Tracking & Logging:** Implemented using Log4J.
- **Code Quality:** Maintained using PMD for detecting common programming flaws.
- **Version Control:** GitHub used for version control and collaborative development.

## Installation and Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/pharmacy-billing-management-system.git
   ```
2. **Set Up MySQL Database:**
   - Create a MySQL database and import the provided SQL scripts.
   - Update the database configuration in `database.properties`.

3. **Build the Project:**
   - Use an IDE like Eclipse or IntelliJ IDEA to import the project as a Maven project.
   - Build the project to resolve dependencies.

4. **Deploy on Tomcat:**
   - Deploy the `war` file generated in the `target` folder to an Apache Tomcat server.
   - Start the Tomcat server and access the application via `http://localhost:8080/pharmacy-billing-management-system`.

## Future Enhancements

- **Inventory Alerts:** Notify admins when product quantities are low.
- **Online Ordering:** Allow customers to sign in and order medicines online.
- **Recommendation System:** Suggest medicines based on customer symptoms using AI.
- **Advanced Analytics:** Implement machine learning algorithms to optimize drug inventory and supply chain management.
 
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
