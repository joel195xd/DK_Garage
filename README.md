
# Sistema de Estacionamiento / Parking System

## Descripción / Description

**Español:**
Este script implementa un sistema de estacionamiento para servidores de FiveM, permitiendo a los jugadores estacionar y recuperar sus vehículos. Los datos de los vehículos se almacenan en una base de datos MySQL.

**English:**
This script implements a parking system for FiveM servers, allowing players to park and retrieve their vehicles. The vehicle data is stored in a MySQL database.

## Instalación / Installation

1. **Configura la Base de Datos / Set up the Database:**
   - Asegúrate de tener una base de datos MySQL en funcionamiento.
   - Ejecuta el script SQL proporcionado para crear la tabla `parked_vehicles`.

   **Ensure you have a MySQL database running. Execute the provided SQL script to create the `parked_vehicles` table.**

2. **Instala `mysql-async` o `ghmattimysql` / Install `mysql-async` or `ghmattimysql`:**
   - Instala y configura el recurso para la comunicación con la base de datos en tu servidor de FiveM.

   **Install and configure the resource for database communication in your FiveM server.**

3. **Guardar los Archivos / Save the Files:**
   - Guarda `server.lua` y `client.lua` en una carpeta de tu servidor de FiveM, por ejemplo, `resources/[your_scripts]/parking_system/`.

   **Save `server.lua` and `client.lua` in a folder on your FiveM server, e.g., `resources/[your_scripts]/parking_system/`.**

4. **Archivo `fxmanifest.lua` / Create the `fxmanifest.lua`:**
   - Crea un archivo `fxmanifest.lua` en la misma carpeta con el siguiente contenido:

   **Create a `fxmanifest.lua` file in the same folder with the following content:**

   ```lua
   fx_version 'cerulean'
   game 'gta5'

   author 'Dark'
   description 'Sistema de estacionamiento para FiveM'
   version '1.0'

   client_script 'client.lua'
   server_script 'server.lua'
   ```

5. **Configurar el Servidor / Configure the Server:**
   - Añade `start parking_system` en tu archivo `server.cfg`.

   **Add `start parking_system` to your `server.cfg` file.**

## Uso / Usage

**Español:**
- Usa los comandos `/park` para estacionar el vehículo y `/retrieve` para recuperar los vehículos estacionados.

**English:**
- Use the commands `/park` to park the vehicle and `/retrieve` to retrieve parked vehicles.

## Contribución / Contribution

**Español:**
¡Si deseas contribuir al desarrollo de este script, siéntete libre de hacer un fork y enviar un pull request!

**English:**
If you want to contribute to the development of this script, feel free to fork and submit a pull request!

## Contacto / Contact

**Español:**
Para cualquier consulta, puedes contactarme en Discord: darki195

**English:**
For any inquiries, you can contact me on Discord: darki195
