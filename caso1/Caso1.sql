SELECT 
    CONCAT(p.first_name, ' ', p.middle_name, ' ', p.last_name, ' ', p.second_last_name) AS nombreCompleto,
    u.username AS usuario,
    r.name AS rol,
    m.name AS modulo,
    v.name AS vista
FROM 
    person p
INNER JOIN user u ON p.id = u.person_id
INNER JOIN user_role ur ON u.id = ur.user_id
INNER JOIN role r ON ur.role_id = r.id
INNER JOIN role_module rm ON r.id = rm.role_id
INNER JOIN module m ON rm.module_id = m.id
INNER JOIN module_view mv ON m.id = mv.module_id
INNER JOIN view v ON mv.view_id = v.id