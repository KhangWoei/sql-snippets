SELECT
    pid,
    application_name,
    state,
    state_change,
    backend_start,
    NOW() - backend_start AS connection_age,
    NOW() - state_change AS time_in_state,
    query
FROM pg_stat_activity
WHERE application_name = $1
ORDER BY backend_start;
