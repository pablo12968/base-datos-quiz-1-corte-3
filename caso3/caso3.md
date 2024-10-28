# Caso 3: Consulta de roles, módulos y vistas por usuario autenticado

Esta consulta SQL permite obtener la lista de roles a los que una persona tiene acceso, junto con sus módulos y vistas asociadas. La información se muestra únicamente si el nombre de usuario y la contraseña proporcionados coinciden.

## Descripción de la consulta
- **Objetivo**: Mostrar roles, módulos y vistas asociados a un usuario específico, autenticando con nombre de usuario y contraseña.
- **Entrada**: Nombre de usuario y contraseña.
- **Salida**: Listado de roles, módulos y vistas accesibles para el usuario autenticado.

## Código SQL

```sql
-- Definir variables para el nombre de usuario y contraseña
SET @username = 'pablo123';
SET @password = 'abcd1234';

SELECT 
    r.name AS rol,
    m.name AS modulo,
    v.name AS vista
FROM 
    user u
INNER JOIN person p ON u.person_id = p.id
INNER JOIN user_role ur ON u.id = ur.user_id
INNER JOIN role r ON ur.role_id = r.id
INNER JOIN role_module rm ON r.id = rm.role_id
INNER JOIN module m ON rm.module_id = m.id
INNER JOIN module_view mv ON m.id = mv.module_id
INNER JOIN view v ON mv.view_id = v.id
WHERE 
    u.username = @username
    AND u.password = @password;
![completa](c:\Users\ASUS\OneDrive\Documentos\Repositoriooo\base-datos-quiz-1-corte-3\caso3\img\filtro.png)
![filtro](c:\Users\ASUS\OneDrive\Documentos\Repositoriooo\base-datos-quiz-1-corte-3\caso3\img\filtro.png)