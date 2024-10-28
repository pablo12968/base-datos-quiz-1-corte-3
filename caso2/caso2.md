# Consulta de vistas por rol

Esta consulta SQL permite obtener la lista de vistas a las que tiene acceso un rol específico. 

## Descripción de la consulta
- **Objetivo**: Listar las vistas accesibles por rol, incluyendo información del usuario, rol, módulo y vista.
- **Entrada**: Nombre del rol.
- **Salida**: Listado de vistas y módulos accesibles para el rol especificado.

## Código SQL

```sql

SET @nombre_del_rol = 'Administrador';

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
WHERE 
    r.name = @nombre_del_rol;

    # Resultado

![Consulta completa](./img/c:\Users\ASUS\OneDrive\Imágenes\completa.png)
![Consulta con filtro](./img/c:\Users\ASUS\OneDrive\Imágenes\filtro.png)
