<div align="center">
	<h1>Candidate Tracker</h1>

[![GitHub contributors](https://img.shields.io/badge/Contributors-3-blueviolet?style=flat-square)](#contributors)&emsp;
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-orange.svg?style=flat-square)](http://makeapullrequest.com)&emsp;
[![npm version](https://img.shields.io/badge/npm-v6.9.0-blue?style=flat-square)](https://www.npmjs.com/)&emsp;
[![Spring Boot](https://img.shields.io/badge/Made%20with-Spring%20Boot-brightgreen?style=flat-square)](https://start.spring.io/)&emsp;
[![Angular](https://img.shields.io/badge/Made%20with-Angular-red?style=flat-square)](https://angular.io/)&emsp;
[![Build](https://img.shields.io/badge/Build-Passing-green?style=flat-square)]()
</div>

* Candidate Tracker is web-based recruitment platform. It can be used to track profile of candidate and supports end to end recruitment process from picking up a candidate's profile to onboarding of the candidate.


## Features
* Dedicated dashboard for every user role. User role is automatically identified upon successful login.
* JWT based authentication and authorization.
* Support for virtual interview between candidate and interviewer using Google Meet.
* Email notifications for account creation, candidate hired or rejected.
* Calendar invite for interviews scheduled.
* Option to upload candidate CV.
* Search, sort and filter candidates.
* Statistics for custom duration.

## Screenshots
<img src="./assets/dashboard.png" height=240px width=400px>&emsp;
<img src="./assets/interview.png" height=240px width=400px><br><br>
<img src="./assets/candidates.png" height=240px width=400px>&emsp;
<img src="./assets/calendar.png" height=240px width=400px><br>

## Technology Stack
* Java
* Angular 9
* MySQL Database
* Spring Boot
* Gradle

## Repositories
* [Candidate-Tracker-Server](https://github.com/harshpatel23/Candidate-Tracker-Server)
* [Candidate-Tracker-App](https://github.com/shivaneej/Candidate-Tracker-App)

## How To Run
1. Clone the repository with all the submodule<br>
    `git clone --recurse-submodules <URL here>`
2. Import `database/candidate_tracker_schema` in MySQL Workbench.    
3. Start the Spring Server by running<br>
    `./Candidate-Tracker-Server/gradlew/bootRun`
4. Navigate to `Candidate-Tracker-App`<br>
    `cd Candidate-Tracker-App`
4. Install npm dependencies by running<br>
    `npm install`
5. Start the Application Server by running<br>
    `ng serve`
6. Open `http://localhost:4200/` in your browser to view the application.


## Contributors
* [Shivanee Jaiswal](https://www.github.com/shivaneej)
* [Harsh Patel](https://github.com/harshpatel23)
* [Hitanshu Shah](https://github.com/hitanshu310)
