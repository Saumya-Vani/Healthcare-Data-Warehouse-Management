CREATE
OR REPLACE VIEW "public"."no_show_analysis" AS
SELECT
    healthcare_data.gender,
    CASE
    WHEN healthcare_data.age < 18 THEN 'Child':: text
    WHEN healthcare_data.age >= 18
    AND healthcare_data.age <= 35 THEN 'Young Adult':: text
    WHEN healthcare_data.age >= 36
    AND healthcare_data.age <= 60 THEN 'Adult':: text
    ELSE 'Senior':: text END AS age_group,
    count(*) AS total_appointments,
    sum(
        CASE
        WHEN healthcare_data.showed_up = false THEN 1
        ELSE 0 END
    ) AS no_show_count,
    round(
        sum(
            CASE
            WHEN healthcare_data.showed_up = false THEN 1
            ELSE 0 END
        ):: numeric * 100.0 / count(*):: numeric,
        2
    ) AS no_show_rate
FROM
    healthcare_data
GROUP BY
    healthcare_data.gender,
    CASE
    WHEN healthcare_data.age < 18 THEN 'Child':: text
    WHEN healthcare_data.age >= 18
    AND healthcare_data.age <= 35 THEN 'Young Adult':: text
    WHEN healthcare_data.age >= 36
    AND healthcare_data.age <= 60 THEN 'Adult':: text
    ELSE 'Senior':: text END;

CREATE
OR REPLACE VIEW "public"."appointment_trends_neighbourhood" AS
SELECT
    healthcare_data.neighbourhood,
    count(*) AS total_appointments,
    sum(
        CASE
        WHEN healthcare_data.showed_up = true THEN 1
        ELSE 0 END
    ) AS showed_up_count,
    sum(
        CASE
        WHEN healthcare_data.showed_up = false THEN 1
        ELSE 0 END
    ) AS no_show_count
FROM
    healthcare_data
GROUP BY
    healthcare_data.neighbourhood
ORDER BY
    count(*) DESC;

CREATE TABLE daily_appointment_summary AS
SELECT 
    AppointmentDay,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Showed_up = TRUE THEN 1 ELSE 0 END) AS showed_up_count,
    SUM(CASE WHEN Showed_up = FALSE THEN 1 ELSE 0 END) AS no_show_count
FROM healthcare_data
GROUP BY AppointmentDay
ORDER BY AppointmentDay;

CREATE TABLE health_condition_summary AS
SELECT 
    Scholarship,
    Hipertension,
    Diabetes,
    Alcoholism,
    Handcap,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Showed_up = TRUE THEN 1 ELSE 0 END) AS showed_up_count,
    SUM(CASE WHEN Showed_up = FALSE THEN 1 ELSE 0 END) AS no_show_count
FROM healthcare_data
GROUP BY Scholarship, Hipertension, Diabetes, Alcoholism, Handcap;
