-- create database
create database project;
-- use database
use project;
-- create users table
create table users (
    user_id int primary key auto_increment,
    name varchar(255) not null,
    email varchar(200) unique not null,
    password varchar(200) not null,
    phone varchar(50),
    created_at datetime default current_timestamp);
-- create resumes table
create table resumes (
    resume_id int primary key auto_increment,
    user_id int,
    title varchar(200) not null,
    summary text,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    foreign key (user_id) references users(user_id) on delete cascade);
-- create personal_info table
create table personal_info (
    info_id int primary key auto_increment,
    resume_id int unique,
    full_name varchar(200) not null,
    email varchar(200),
    phone varchar(50),
    address text,
    linkedin varchar(200),
    github varchar(200),
    foreign key (resume_id) references resumes(resume_id) on delete cascade);
-- create education table
create table education (
    edu_id int primary key auto_increment,
    resume_id int,
    degree varchar(200) not null,
    institution varchar(200) not null,
    start_date date,
    end_date date,
    grade varchar(50),
    foreign key (resume_id) references resumes(resume_id) on delete cascade);
-- create experience table
create table experience (
    exp_id int primary key auto_increment,
    resume_id int,
    company_name varchar(200) not null,
    role varchar(200) not null,
    start_date date,
    end_date date,
    description text,
    foreign key (resume_id) references resumes(resume_id) on delete cascade);
-- create skills table
create table skills (
    skill_id int primary key auto_increment,
    resume_id int,
    skill_name varchar(200) not null,
    proficiency varchar(50),
    foreign key (resume_id) references resumes(resume_id) on delete cascade);
-- create projects table
create table projects (
    project_id int primary key auto_increment,
    resume_id int,
    project_name varchar(200) not null,
    description text,
    link varchar(200),
    foreign key (resume_id) references resumes(resume_id) on delete cascade);
-- create certifications table
create table certifications (
    cert_id int primary key auto_increment,
    resume_id int,
    cert_name varchar(200) not null,
    issued_by varchar(200),
    date date,
    foreign key (resume_id) references resumes(resume_id) on delete cascade);
-- create templates table
create table templates (
    template_id int primary key auto_increment,
    template_name varchar(200) not null,
    preview_link varchar(200));
-- create resume_template table
create table resume_template (
    resume_id int unique,
    template_id int,
    primary key (resume_id, template_id),
    foreign key (resume_id) references resumes(resume_id) on delete cascade,
    foreign key (template_id) references templates(template_id) on delete cascade);
    -- insert values into users table
insert into users (name, email, password, phone) values
('John Doe', 'john.doe@email.com', 'password123', '9876543210'),
('Emma Smith', 'emma.smith@email.com', 'pass456', '9876543211'),
('Liam Johnson', 'liam.johnson@email.com', 'securepass789', '9876543212'),
('Olivia Brown', 'olivia.brown@email.com', 'mypassword', '9876543213'),
('Noah Williams', 'noah.williams@email.com', 'qwerty123', '9876543214'),
('Ava Jones', 'ava.jones@email.com', 'letmein', '9876543215'),
('Sophia Garcia', 'sophia.garcia@email.com', 'welcome1', '9876543216'),
('Mason Miller', 'mason.miller@email.com', 'ilovecoding', '9876543217'),
('Isabella Davis', 'isabella.davis@email.com', 'pass@2024', '9876543218'),
('Lucas Rodriguez', 'lucas.rodriguez@email.com', 'hello123', '9876543219'),
('Mia Martinez', 'mia.martinez@email.com', 'admin2024', '9876543220'),
('Elijah Hernandez', 'elijah.hernandez@email.com', 'testpass', '9876543221'),
('Charlotte Lopez', 'charlotte.lopez@email.com', 'myp@ssword', '9876543222'),
('James Gonzalez', 'james.gonzalez@email.com', 'p@ssword123', '9876543223'),
('Benjamin Wilson', 'benjamin.wilson@email.com', 'secure!pass', '9876543224'),
('Evelyn Anderson', 'evelyn.anderson@email.com', 'goodpass2024', '9876543225'),
('Henry Thomas', 'henry.thomas@email.com', 'pass9876', '9876543226'),
('Amelia Taylor', 'amelia.taylor@email.com', 'wordpass', '9876543227'),
('Daniel Moore', 'daniel.moore@email.com', 'mypassword1', '9876543228'),
('Harper Jackson', 'harper.jackson@email.com', 'testpass123', '9876543229');
-- insert values into resumes table
insert into resumes (resume_id, user_id, title, summary, created_at) values
(1, 1, 'Software Developer Resume', 'Experienced in Java & Python development.', '2024-01-10'),
(2, 2, 'Data Analyst Resume', 'Proficient in SQL and data visualization tools.', '2024-02-15'),
(3, 3, 'Mechanical Engineer Resume', 'Expert in CAD modeling and design.', '2024-03-05'),
(4, 4, 'Marketing Manager Resume', '10+ years experience in brand management.', '2024-04-12'),
(5, 5, 'Graphic Designer Resume', 'Creative professional skilled in Adobe Suite.', '2024-05-20'),
(6, 6, 'Civil Engineer Resume', 'Experience in infrastructure and road projects.', '2024-06-25'),
(7, 7, 'Machine Learning Engineer Resume', 'AI and ML specialist with hands-on experience.', '2024-07-05'),
(8, 8, 'Product Manager Resume', 'Specialist in agile methodologies and product development.', '2024-08-15'),
(9, 9, 'Cybersecurity Analyst Resume', 'Certified ethical hacker with network security skills.', '2024-09-20'),
(10, 10, 'HR Specialist Resume', 'HR professional with expertise in talent acquisition.', '2024-10-30'),
(11, 11, 'Electrical Engineer Resume', 'Designing circuits and automation systems.', '2024-01-22'),
(12, 12, 'Finance Analyst Resume', 'Strong background in corporate finance.', '2024-02-18'),
(13, 13, 'UI/UX Designer Resume', 'Expert in Figma, Adobe XD, and user research.', '2024-03-14'),
(14, 14, 'Mechanical Engineer Resume', 'Manufacturing process optimization.', '2024-04-11'),
(15, 15, 'Backend Developer Resume', 'Django, Flask, and Node.js expertise.', '2024-05-19'),
(16, 16, 'Cloud Engineer Resume', 'AWS, Azure, and Google Cloud experience.', '2024-06-26'),
(17, 17, 'Full Stack Developer Resume', 'React, Node.js, and MongoDB experience.', '2024-07-13'),
(18, 18, 'Business Analyst Resume', 'Market research and data-driven strategies.', '2024-08-21'),
(19, 19, 'Data Scientist Resume', 'Expertise in big data analytics and AI.', '2024-09-23'),
(20, 20, 'DevOps Engineer Resume', 'CI/CD, Kubernetes, and automation skills.', '2024-10-25');
-- insert values into personal_info table  
insert into personal_info (resume_id, full_name, email, phone, address, linkedin, github) values
(1, 'John Doe', 'john.doe@email.com', '9876543210', '123 Main St, New York, NY', 'linkedin.com/in/johndoe', 'github.com/johndoe'),
(2, 'Emma Smith', 'emma.smith@email.com', '9876543211', '456 Elm St, San Francisco, CA', 'linkedin.com/in/emmasmith', 'github.com/emmasmith'),
(3, 'Liam Johnson', 'liam.johnson@email.com', '9876543212', '789 Pine St, Chicago, IL', 'linkedin.com/in/liamjohnson', 'github.com/liamjohnson'),
(4, 'Olivia Brown', 'olivia.brown@email.com', '9876543213', '234 Oak St, Los Angeles, CA', 'linkedin.com/in/oliviabrown', 'github.com/oliviabrown'),
(5, 'Noah Williams', 'noah.williams@email.com', '9876543214', '567 Birch St, Houston, TX', 'linkedin.com/in/noahwilliams', 'github.com/noahwilliams'),
(6, 'Ava Jones', 'ava.jones@email.com', '9876543215', '890 Cedar St, Miami, FL', 'linkedin.com/in/avajones', 'github.com/avajones'),
(7, 'Sophia Garcia', 'sophia.garcia@email.com', '9876543216', '345 Maple St, Seattle, WA', 'linkedin.com/in/sophiagarcia', 'github.com/sophiagarcia'),
(8, 'Mason Miller', 'mason.miller@email.com', '9876543217', '678 Willow St, Boston, MA', 'linkedin.com/in/masonmiller', 'github.com/masonmiller'),
(9, 'Isabella Davis', 'isabella.davis@email.com', '9876543218', '901 Redwood St, Atlanta, GA', 'linkedin.com/in/isabelladavis', 'github.com/isabelladavis'),
(10, 'Lucas Rodriguez', 'lucas.rodriguez@email.com', '9876543219', '234 Spruce St, Denver, CO', 'linkedin.com/in/lucasrodriguez', 'github.com/lucasrodriguez'),
(11, 'Mia Martinez', 'mia.martinez@email.com', '9876543220', '567 Poplar St, Austin, TX', 'linkedin.com/in/miamartinez', 'github.com/miamartinez'),
(12, 'Elijah Hernandez', 'elijah.hernandez@email.com', '9876543221', '890 Fir St, San Diego, CA', 'linkedin.com/in/elijahhernandez', 'github.com/elijahhernandez'),
(13, 'Charlotte Lopez', 'charlotte.lopez@email.com', '9876543222', '123 Cypress St, Philadelphia, PA', 'linkedin.com/in/charlottelopez', 'github.com/charlottelopez'),
(14, 'James Gonzalez', 'james.gonzalez@email.com', '9876543223', '456 Palm St, Dallas, TX', 'linkedin.com/in/jamesgonzalez', 'github.com/jamesgonzalez'),
(15, 'Benjamin Wilson', 'benjamin.wilson@email.com', '9876543224', '789 Ash St, Phoenix, AZ', 'linkedin.com/in/benjaminwilson', 'github.com/benjaminwilson'),
(16, 'Evelyn Anderson', 'evelyn.anderson@email.com', '9876543225', '234 Magnolia St, Las Vegas, NV', 'linkedin.com/in/evelynanderson', 'github.com/evelynanderson'),
(17, 'Henry Thomas', 'henry.thomas@email.com', '9876543226', '567 Cherry St, Portland, OR', 'linkedin.com/in/henrythomas', 'github.com/henrythomas'),
(18, 'Amelia Taylor', 'amelia.taylor@email.com', '9876543227', '890 Dogwood St, Nashville, TN', 'linkedin.com/in/ameliataylor', 'github.com/ameliataylor'),
(19, 'Daniel Moore', 'daniel.moore@email.com', '9876543228', '345 Olive St, Charlotte, NC', 'linkedin.com/in/danielmoore', 'github.com/danielmoore'),
(20, 'Harper Jackson', 'harper.jackson@email.com', '9876543229', '678 Bamboo St, San Antonio, TX', 'linkedin.com/in/harperjackson', 'github.com/harperjackson');
-- insert values into education table
insert into education (resume_id, degree, institution, start_date, end_date, grade) values
(1, 'Bachelor of Science in Computer Science', 'Harvard University', '2018-08-15', '2022-05-20', '3.8/4.0'),
(2, 'Master of Business Administration', 'Stanford University', '2019-09-01', '2021-06-15', '3.9/4.0'),
(3, 'Bachelor of Engineering in Mechanical', 'MIT', '2017-07-10', '2021-05-25', '3.7/4.0'),
(4, 'Bachelor of Arts in Psychology', 'University of California, Berkeley', '2018-09-05', '2022-06-10', '3.5/4.0'),
(5, 'Master of Science in Data Science', 'Columbia University', '2020-01-10', '2022-12-15', '3.8/4.0'),
(6, 'Bachelor of Business Administration', 'University of Chicago', '2016-08-20', '2020-05-30', '3.6/4.0'),
(7, 'Bachelor of Science in Electrical Engineering', 'Carnegie Mellon University', '2017-09-15', '2021-06-20', '3.9/4.0'),
(8, 'Bachelor of Science in Biology', 'Yale University', '2019-08-25', '2023-05-15', '3.7/4.0'),
(9, 'Master of Computer Applications', 'University of Illinois', '2018-07-15', '2020-12-10', '3.8/4.0'),
(10, 'Bachelor of Science in Mathematics', 'Princeton University', '2017-06-10', '2021-05-20', '3.9/4.0'),
(11, 'Master of Finance', 'University of Pennsylvania', '2019-09-01', '2021-06-15', '3.9/4.0'),
(12, 'Bachelor of Science in Civil Engineering', 'Texas A&M University', '2016-08-10', '2020-05-25', '3.7/4.0'),
(13, 'Bachelor of Science in Software Engineering', 'University of Michigan', '2018-09-05', '2022-06-10', '3.8/4.0'),
(14, 'Bachelor of Arts in Economics', 'Duke University', '2017-07-20', '2021-05-30', '3.6/4.0'),
(15, 'Master of Science in Cybersecurity', 'New York University', '2020-01-10', '2022-12-15', '3.9/4.0'),
(16, 'Bachelor of Science in Physics', 'University of California, Los Angeles', '2017-08-20', '2021-06-20', '3.8/4.0'),
(17, 'Bachelor of Science in Artificial Intelligence', 'University of Washington', '2019-08-25', '2023-05-15', '3.7/4.0'),
(18, 'Master of Science in Robotics', 'Georgia Institute of Technology', '2018-07-15', '2020-12-10', '3.8/4.0'),
(19, 'Bachelor of Science in Biotechnology', 'University of Wisconsin', '2016-06-10', '2020-05-20', '3.9/4.0'),
(20, 'Master of Data Analytics', 'University of Southern California', '2019-09-01', '2021-06-15', '3.9/4.0');
-- insert values into education table
insert into education (resume_id, degree, institution, start_date, end_date, grade) values
(1, 'Bachelor of Computer Science', 'Harvard University', '2018-08-15', '2022-05-20', '3.8/4.0'),
(2, 'Master of Business Administration', 'Stanford University', '2019-09-01', '2021-06-15', '3.9/4.0'),
(3, 'Bachelor of Engineering in Mechanical', 'MIT', '2017-07-10', '2021-05-25', '3.7/4.0'),
(4, 'Bachelor of Arts in Psychology', 'UC Berkeley', '2018-09-05', '2022-06-10', '3.5/4.0'),
(5, 'Master of Data Science', 'Columbia University', '2020-01-10', '2022-12-15', '3.8/4.0'),
(6, 'Bachelor of Business Administration', 'University of Chicago', '2016-08-20', '2020-05-30', '3.6/4.0'),
(7, 'Bachelor of Electrical Engineering', 'Carnegie Mellon University', '2017-09-15', '2021-06-20', '3.9/4.0'),
(8, 'Bachelor of Science in Biology', 'Yale University', '2019-08-25', '2023-05-15', '3.7/4.0'),
(9, 'Master of Computer Applications', 'University of Illinois', '2018-07-15', '2020-12-10', '3.8/4.0'),
(10, 'Bachelor of Mathematics', 'Princeton University', '2017-06-10', '2021-05-20', '3.9/4.0'),
(11, 'Master of Finance', 'University of Pennsylvania', '2019-09-01', '2021-06-15', '3.9/4.0'),
(12, 'Bachelor of Civil Engineering', 'Texas A&M University', '2016-08-10', '2020-05-25', '3.7/4.0'),
(13, 'Bachelor of Software Engineering', 'University of Michigan', '2018-09-05', '2022-06-10', '3.8/4.0'),
(14, 'Bachelor of Arts in Economics', 'Duke University', '2017-07-20', '2021-05-30', '3.6/4.0'),
(15, 'Master of Cybersecurity', 'New York University', '2020-01-10', '2022-12-15', '3.9/4.0'),
(16, 'Bachelor of Physics', 'UCLA', '2017-08-20', '2021-06-20', '3.8/4.0'),
(17, 'Bachelor of Artificial Intelligence', 'University of Washington', '2019-08-25', '2023-05-15', '3.7/4.0'),
(18, 'Master of Robotics', 'Georgia Tech', '2018-07-15', '2020-12-10', '3.8/4.0'),
(19, 'Bachelor of Biotechnology', 'University of Wisconsin', '2016-06-10', '2020-05-20', '3.9/4.0'),
(20, 'Master of Data Analytics', 'USC', '2019-09-01', '2021-06-15', '3.9/4.0');
-- insert values experience table
insert into experience (resume_id, company_name, role, start_date, end_date, description) values
(1, 'Google', 'Software Engineer', '2020-06-01', '2023-03-15', 'Worked on scalable cloud applications and AI-based solutions.'),
(2, 'Microsoft', 'Data Analyst', '2019-07-10', '2022-11-20', 'Analyzed business data and developed reports using Power BI and SQL.'),
(3, 'Amazon', 'Cloud Engineer', '2018-05-01', '2021-12-15', 'Designed AWS cloud architecture and optimized server performance.'),
(4, 'Facebook', 'Frontend Developer', '2021-01-15', '2023-07-10', 'Developed modern UI/UX interfaces using React and Tailwind CSS.'),
(5, 'Tesla', 'Electrical Engineer', '2017-09-01', '2020-06-30', 'Designed battery management systems and electric vehicle circuits.'),
(6, 'Netflix', 'Machine Learning Engineer', '2018-06-01', '2021-09-15', 'Built recommendation algorithms for personalized content suggestions.'),
(7, 'Adobe', 'UX Designer', '2019-03-10', '2022-05-20', 'Designed and prototyped user-friendly interfaces for creative software.'),
(8, 'Spotify', 'Backend Developer', '2020-09-15', '2023-04-30', 'Developed API services and optimized backend performance.'),
(9, 'Apple', 'iOS Developer', '2018-04-20', '2021-08-10', 'Designed and maintained iOS applications for Apple services.'),
(10, 'Intel', 'Hardware Engineer', '2019-08-10', '2022-02-28', 'Designed chip architecture and optimized processor performance.'),
(11, 'Oracle', 'Database Administrator', '2017-11-15', '2021-01-05', 'Managed enterprise databases and optimized SQL queries.'),
(12, 'IBM', 'Cybersecurity Analyst', '2020-05-01', '2023-02-15', 'Monitored security threats and implemented firewalls.'),
(13, 'SAP', 'Business Analyst', '2018-07-01', '2021-10-10', 'Managed business processes and optimized workflow efficiency.'),
(14, 'Uber', 'Full Stack Developer', '2019-02-20', '2022-06-25', 'Developed ride-booking features using Node.js and React.'),
(15, 'SpaceX', 'Aerospace Engineer', '2017-10-15', '2020-12-30', 'Worked on spacecraft propulsion systems and aerodynamics.'),
(16, 'Cisco', 'Network Engineer', '2018-05-10', '2021-07-20', 'Designed and maintained enterprise-level networking solutions.'),
(17, 'Samsung', 'Embedded Systems Engineer', '2019-09-05', '2023-03-30', 'Developed firmware for smart devices and IoT solutions.'),
(18, 'LinkedIn', 'Growth Marketing Manager', '2020-01-01', '2022-09-15', 'Implemented data-driven marketing strategies for platform growth.'),
(19, 'Twitter', 'Content Moderator', '2018-03-20', '2021-05-10', 'Reviewed and filtered user-generated content for community guidelines.'),
(20, 'Airbnb', 'Operations Manager', '2019-06-01', '2022-12-15', 'Managed short-term rental operations and improved customer experience.');
-- insert values into skills table 
 insert into skills (skill_id, resume_id, skill_name, proficiency) values
(1, 1, 'Python', 'Expert'),
(2, 1, 'SQL', 'Intermediate'),
(3, 2, 'Java', 'Advanced'),
(4, 2, 'C++', 'Beginner'),
(5, 3, 'JavaScript', 'Expert'),
(6, 3, 'HTML & CSS', 'Advanced'),
(7, 4, 'React', 'Intermediate'),
(8, 4, 'Node.js', 'Intermediate'),
(9, 5, 'PHP', 'Advanced'),
(10, 5, 'Laravel', 'Intermediate'),
(11, 6, 'Machine Learning', 'Beginner'),
(12, 6, 'TensorFlow', 'Beginner'),
(13, 7, 'Cybersecurity', 'Intermediate'),
(14, 7, 'Ethical Hacking', 'Advanced'),
(15, 8, 'DevOps', 'Intermediate'),
(16, 8, 'Docker', 'Beginner'),
(17, 9, 'Flutter', 'Intermediate'),
(18, 9, 'Dart', 'Beginner'),
(19, 10, 'Blockchain', 'Advanced'),
(20, 10, 'Solidity', 'Intermediate');
-- insert values into projects table
insert into projects (project_id, resume_id, project_name, description, link) values
(1, 1, 'E-commerce Website', 'Developed an online store with payment integration.', 'https://myecommerce.com'),
(2, 1, 'Portfolio Website', 'Created a personal portfolio with interactive UI.', 'https://myportfolio.com'),
(3, 2, 'Library Management System', 'Built a web app to manage library books and users.', 'https://librarysystem.com'),
(4, 2, 'Weather App', 'Developed a real-time weather forecasting app.', 'https://weatherapp.com'),
(5, 3, 'Chat Application', 'Built a chat app with real-time messaging using WebSockets.', 'https://chatapp.com'),
(6, 3, 'To-Do List App', 'Designed a task management app with cloud sync.', 'https://todolist.com'),
(7, 4, 'Online Resume Builder', 'Developed a tool to create resumes dynamically.', 'https://resumebuilder.com'),
(8, 4, 'Expense Tracker', 'A financial tracker to monitor daily expenses.', 'https://expensetracker.com'),
(9, 5, 'AI Chatbot', 'Designed an AI-powered chatbot for customer support.', 'https://aichatbot.com'),
(10, 5, 'Food Delivery App', 'Built a food delivery service app with tracking.', 'https://fooddelivery.com'),
(11, 6, 'Movie Recommendation System', 'Implemented a recommendation engine using ML.', 'https://movierecommender.com'),
(12, 6, 'E-learning Platform', 'Created an online learning system with quizzes.', 'https://elearning.com'),
(13, 7, 'Blockchain Voting System', 'Developed a secure voting system using blockchain.', 'https://votingsystem.com'),
(14, 7, 'Stock Price Prediction', 'Built a model to predict stock prices using ML.', 'https://stockprediction.com'),
(15, 8, 'IoT Smart Home System', 'Designed a smart home system controlled via app.', 'https://smarthome.com'),
(16, 8, 'Personal Finance Manager', 'A financial management app with analytics.', 'https://financemanager.com'),
(17, 9, 'Freelance Job Portal', 'Created a job-matching platform for freelancers.', 'https://freelanceportal.com'),
(18, 9, 'Hospital Management System', 'Developed a hospital record-keeping system.', 'https://hospitalms.com'),
(19, 10, 'Gaming App', 'Designed a mobile game with multiplayer support.', 'https://gamingapp.com'),
(20, 10, 'Cybersecurity Tool', 'Built a tool to detect vulnerabilities in networks.', 'https://cybersecuritytool.com');
-- insert values into certifications table
insert into certifications (cert_id, resume_id, cert_name, issued_by, date) values
(1, 1, 'Google Data Analytics', 'Google', '2023-05-10'),
(2, 1, 'AWS Certified Solutions Architect', 'Amazon AWS', '2023-06-15'),
(3, 2, 'Microsoft Azure Fundamentals', 'Microsoft', '2023-07-20'),
(4, 2, 'Certified Ethical Hacker (CEH)', 'EC-Council', '2023-08-25'),
(5, 3, 'Python for Data Science', 'Coursera', '2023-09-05'),
(6, 3, 'Machine Learning Certification', 'Stanford University', '2023-10-10'),
(7, 4, 'Google Cloud Associate Engineer', 'Google Cloud', '2023-11-15'),
(8, 4, 'Full Stack Web Development', 'Udacity', '2023-12-01'),
(9, 5, 'Cyber Security Fundamentals', 'Cisco', '2024-01-10'),
(10, 5, 'React.js Developer Certification', 'Meta', '2024-02-05'),
(11, 6, 'Blockchain Basics', 'IBM', '2024-03-01'),
(12, 6, 'Kubernetes Administrator Certification', 'Cloud Native Computing Foundation', '2024-03-10'),
(13, 7, 'CompTIA Security+', 'CompTIA', '2024-04-15'),
(14, 7, 'Linux System Administration', 'Red Hat', '2024-04-25'),
(15, 8, 'Project Management Professional (PMP)', 'PMI', '2024-05-05'),
(16, 8, 'Java Programming Masterclass', 'Udemy', '2024-05-15'),
(17, 9, 'SQL for Data Analysis', 'DataCamp', '2024-06-10'),
(18, 9, 'Artificial Intelligence Certification', 'MIT', '2024-06-25'),
(19, 10, 'Android App Development', 'Google', '2024-07-05'),
(20, 10, 'Certified Scrum Master (CSM)', 'Scrum Alliance', '2024-07-15');
-- insert values into templates table
insert into templates (template_id, template_name, preview_link) values
(1, 'Modern Blue', 'https://example.com/templates/modern-blue'),
(2, 'Classic Black', 'https://example.com/templates/classic-black'),
(3, 'Minimalist White', 'https://example.com/templates/minimalist-white'),
(4, 'Professional Gray', 'https://example.com/templates/professional-gray'),
(5, 'Elegant Gold', 'https://example.com/templates/elegant-gold'),
(6, 'Creative Green', 'https://example.com/templates/creative-green'),
(7, 'Corporate Navy', 'https://example.com/templates/corporate-navy'),
(8, 'Simple Red', 'https://example.com/templates/simple-red'),
(9, 'Tech Blue', 'https://example.com/templates/tech-blue'),
(10, 'Executive Brown', 'https://example.com/templates/executive-brown'),
(11, 'Vibrant Orange', 'https://example.com/templates/vibrant-orange'),
(12, 'Sleek Purple', 'https://example.com/templates/sleek-purple'),
(13, 'Elegant Silver', 'https://example.com/templates/elegant-silver'),
(14, 'Dark Mode', 'https://example.com/templates/dark-mode'),
(15, 'Light Gray', 'https://example.com/templates/light-gray'),
(16, 'Bold Yellow', 'https://example.com/templates/bold-yellow'),
(17, 'Subtle Teal', 'https://example.com/templates/subtle-teal'),
(18, 'Modern Green', 'https://example.com/templates/modern-green'),
(19, 'Stylish Maroon', 'https://example.com/templates/stylish-maroon'),
(20, 'Innovative Pink', 'https://example.com/templates/innovative-pink');
-- insert values into resume_template table
insert into resume_template (resume_id, template_id) values
(1, 3),
(2, 5),
(3, 8),
(4, 1),
(5, 6),
(6, 2),
(7, 10),
(8, 15),
(9, 12),
(10, 4),
(11, 9),
(12, 7),
(13, 14),
(14, 18),
(15, 11),
(16, 19),
(17, 16),
(18, 13),
(19, 20),
(20, 17);
-- create procedure
-- create procedure for call table a specific table 
delimiter //
create procedure get_table_data(in p_table_name varchar(100))
begin
    if p_table_name = 'users' then
        select * from users;
    elseif p_table_name = 'resumes' then
        select * from resumes;
    elseif p_table_name = 'personal_info' then
        select * from personal_info;
    elseif p_table_name = 'education' then
        select * from education;
    elseif p_table_name = 'experience' then
        select * from experience;
    elseif p_table_name = 'skills' then
        select * from skills;
    elseif p_table_name = 'projects' then
        select * from projects;
    elseif p_table_name = 'certifications' then
        select * from certifications;
    elseif p_table_name = 'templates' then
        select * from templates;
    elseif p_table_name = 'resume_template' then
        select * from resume_template;
    else
        signal sqlstate '45000' set message_text = 'invalid table name!';
    end if;
end //
delimiter ;
-- call the specific table
 call get_table_data('users');

-- For add new user in users table
delimiter //
create procedure register_user(
    in p_name varchar(255),
    in p_email varchar(200),
    in p_password varchar(200),
    in p_phone varchar(50),
    in created_at datetime)
begin
insert into users (name, email, password, phone, created_at)
values (p_name, p_email, p_password, p_phone, now());
end //
delimiter ;
-- for adding the new user into the users table
 call register_user('xxx','abc@gmail.com',1234,77344980);

-- create procedure fo search candidates with specific skills
delimiter //
create procedure search_candidates_by_skill(in p_skill varchar(100))
begin
select u.user_id, u.name, u.email, s.skill_name
from users u
JOIN resumes r ON u.user_id = r.user_id
JOIN skills s on r.resume_id = s.resume_id
where s.skill_name like concat('%', p_skill, '%');
end //
delimiter ;
-- for search the specific skills from the candidates 
 call search_candidates_by_skill('python');
 
-- create procedure for find the experience
delimiter //
create procedure find_resumes_by_experience(in p_min_experience int)
begin
select r.resume_id,r.title, e.company_name, e.role, 
timestampdiff(YEAR, e.start_date, e.end_date) as years_of_experience
from resumes r
join experience e on r.resume_id = e.resume_id
where timestampdiff(YEAR, e.start_date, e.end_date) >= p_min_experience;
end //
delimiter ;
-- find the candidates with their experience 
 call find_resumes_by_experience(3);

-- create procedure to get the specific candidate details 
delimiter //
create procedure get_resume_full_details(in p_resume_id int)
begin
-- personal info
select * from resumes where resume_id = p_resume_id;
-- skills
select * from skills where resume_id = p_resume_id;
-- experience
select * from experience where resume_id = p_resume_id;
-- certifications
select * from certifications where resume_id = p_resume_id;
end //
delimiter ;
-- find the specific user details
 call get_resume_full_details(13);

-- create view for display the most common skill 
create view most_common_skill as
select skill_name, count(*) as occurrences
from skills
group by skill_name
order by occurrences desc
limit 1;
-- display the view
 select*from most_common_skill;

-- create view for last three resume display
create view three_month_resume as
select*from resumes 
where created_at >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);
-- display the last three_month_resume
select*from three_month_resume;

-- create the procedure to list the candidate with the number of skills they have
delimiter //
create procedure get_candidates_with_min_skills(in min_skills int)
begin
    select u.user_id, u.name, u.email, count(s.skill_name) as total_skills
    from users u
    join resumes r on u.user_id = r.user_id
    join skills s on r.resume_id = s.resume_id
    group by u.user_id, u.name, u.email
    having total_skills >= min_skills
    order by total_skills desc;
end //
delimiter ;
-- display the candidate_with_min_skills
 call get_candidates_with_min_skills(2);

-- create procedure for recently updated resumes
 delimiter //
create procedure get_recently_updated_resumes(in limit_rows int)
begin
    select resume_id, user_id, title, summary, updated_at
    from resumes
    order by updated_at desc
    limit limit_rows;
end //
delimiter ;
-- call the recently_updated_resumes
 call get_recently_updated_resumes(3);

-- alter the resume table with status
alter table resumes add column status enum ('active', 'deleted') default 'active';

-- create procedure for delete the resume 
delimiter //
create procedure delete_resume(in p_resume_id int)
begin
    update resumes 
    set status = 'deleted'
    where resume_id = p_resume_id;
end //
delimiter ;
-- delete the resume with resume_id
call delete_resume(21);
 










 