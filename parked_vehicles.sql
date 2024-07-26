CREATE TABLE parked_vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id VARCHAR(50),
    vehicle_model VARCHAR(50),
    vehicle_plate VARCHAR(20),
    position_x FLOAT,
    position_y FLOAT,
    position_z FLOAT,
    heading FLOAT
);
