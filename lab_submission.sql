-- CREATE EVN_average_customer_waiting_time_every_1_hour
CREATE EVENT `EVN_average_customer_waiting_time_every_1_hour`
ON SCHEDULE EVERY 1 HOUR
DO
  INSERT INTO customer_service_kpi (customer_service_KPI_average_waiting_time_minutes)
  SELECT IFNULL(AVG(waiting_time_minutes), 0) AS average_waiting_time
  FROM customer_service_ticket
  WHERE ticket_created_time >= NOW() - INTERVAL 1 HOUR;
