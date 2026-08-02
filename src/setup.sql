CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
(
    'BrightFuture Builders',
    'A nonprofit focused on improving community infrastructure through sustainable construction projects.',
    'info@brightfuturebuilders.org',
    'brightfuture-logo.png'
),
(
    'GreenHarvest Growers',
    'An urban farming collective promoting food sustainability and education in local neighborhoods.',
    'contact@greenharvest.org',
    'greenharvest-logo.png'
),
(
    'UnityServe Volunteers',
    'A volunteer coordination group supporting local charities and service initiatives.',
    'hello@unityserve.org',
    'unityserve-logo.png'
);

-- Create service_project table
CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    date DATE,
    FOREIGN KEY (organization_id) REFERENCES organization(organization_id)
);

-- Insert sample service projects
INSERT INTO service_project 
(organization_id, title, description, location, date)
VALUES
-- Organization 1: BrightFuture Builders
(1, 'Food Donation Drive', 'Collect and distribute food to families in need.', 'Lima', '2026-08-05'),
(1, 'Community Garden Project', 'Plant and maintain a garden for the neighborhood.', 'Lima', '2026-08-12'),
(1, 'School Supply Collection', 'Gather school supplies for students.', 'Lima', '2026-08-20'),
(1, 'Senior Support Program', 'Provide assistance and companionship for seniors.', 'Lima', '2026-09-01'),
(1, 'Clean Water Campaign', 'Help provide clean water resources.', 'Lima', '2026-09-10'),

-- Organization 2: GreenHarvest Growers
(2, 'Beach Cleanup', 'Remove trash and protect local beaches.', 'Huacho', '2026-08-07'),
(2, 'Tree Planting Event', 'Plant trees to improve the environment.', 'Huacho', '2026-08-18'),
(2, 'Animal Shelter Support', 'Help care for rescued animals.', 'Huacho', '2026-08-25'),
(2, 'Recycling Workshop', 'Teach recycling practices to the community.', 'Huacho', '2026-09-05'),
(2, 'Youth Mentoring Program', 'Support young people through mentoring.', 'Huacho', '2026-09-15'),

-- Organization 3: UnityServe Volunteers
(3, 'Clothing Donation', 'Collect clothing for families.', 'Cusco', '2026-08-10'),
(3, 'Medical Assistance Campaign', 'Provide basic health support.', 'Cusco', '2026-08-22'),
(3, 'Literacy Program', 'Teach reading skills to children.', 'Cusco', '2026-09-03'),
(3, 'Community Construction', 'Improve community spaces.', 'Cusco', '2026-09-12'),
(3, 'Emergency Relief Project', 'Provide support during emergencies.', 'Cusco', '2026-09-20');

--Categories
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,

    PRIMARY KEY (project_id, category_id),

    FOREIGN KEY (project_id)
        REFERENCES service_project(project_id)
        ON DELETE CASCADE,

    FOREIGN KEY (category_id)
        REFERENCES category(category_id)
        ON DELETE CASCADE
);

INSERT INTO category (name)
VALUES
('Education'),
('Environment'),
('Community Service');

INSERT INTO project_category (project_id, category_id)
VALUES
(1,3),
(2,2),
(3,1),
(4,3),
(5,3),
(6,2),
(7,2),
(8,3),
(9,2),
(10,1),
(11,3),
(12,3),
(13,1),
(14,3),
(15,3);
