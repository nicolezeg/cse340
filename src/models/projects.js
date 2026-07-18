import db from './db.js';

export async function getAllProjects() {
    const query = `
        SELECT 
            service_project.project_id,
            service_project.title,
            service_project.description,
            service_project.location,
            service_project.date,
            organization.name AS organization_name
        FROM service_project
        JOIN organization
        ON service_project.organization_id = organization.organization_id;
    `;

    const result = await db.query(query);

    return result.rows;
}