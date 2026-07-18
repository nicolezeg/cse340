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
-- Organization 1
(1, 'Food Drive', 'Collect and distribute food to families in need.', 'Lima', '2026-08-01'),
(1, 'Community Cleanup', 'Clean public areas and parks.', 'Lima', '2026-08-10'),
(1, 'School Supply Donation', 'Provide school supplies to students.', 'Lima', '2026-08-15'),
(1, 'Senior Assistance', 'Support elderly community members.', 'Lima', '2026-08-20'),
(1, 'Health Awareness Event', 'Promote healthy habits in the community.', 'Lima', '2026-08-25'),

-- Organization 2
(2, 'Tree Planting', 'Plant trees to improve the environment.', 'Cusco', '2026-08-05'),
(2, 'Recycling Campaign', 'Teach recycling practices.', 'Cusco', '2026-08-12'),
(2, 'Animal Shelter Support', 'Help care for rescued animals.', 'Cusco', '2026-08-18'),
(2, 'Youth Mentoring', 'Provide guidance for young people.', 'Cusco', '2026-08-22'),
(2, 'Neighborhood Improvement', 'Improve local community spaces.', 'Cusco', '2026-08-30'),

-- Organization 3
(3, 'Clothing Donation', 'Collect clothes for families.', 'Arequipa', '2026-09-01'),
(3, 'Literacy Program', 'Help children improve reading skills.', 'Arequipa', '2026-09-08'),
(3, 'Emergency Support', 'Provide resources during emergencies.', 'Arequipa', '2026-09-15'),
(3, 'Community Garden', 'Create and maintain a garden.', 'Arequipa', '2026-09-20'),
(3, 'Food Preparation Project', 'Prepare meals for people in need.', 'Arequipa', '2026-09-25');