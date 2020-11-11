create table DM.apex_application_temp_files (
    id number,
    application_id number,
    name varchar2(300),
    filename varchar2(300),
    mime_type varchar2(300),
    created_on date,
    blob_content blob
);
comment on table DM.apex_application_temp_files is 'Application Express (APEX) temporary upload files, automatically deleted at end of request processing or session';
comment on column DM.apex_application_temp_files.ID is 'Primary key that identifies the file';
comment on column DM.apex_application_temp_files.APPLICATION_ID is 'Key that identifies the application';
comment on column DM.apex_application_temp_files.NAME is 'Unique name of the uploaded file';
comment on column DM.apex_application_temp_files.FILENAME is 'Name of the uploaded file, without the unique prefix';
comment on column DM.apex_application_temp_files.MIME_TYPE is 'Mime Type';
comment on column DM.apex_application_temp_files.CREATED_ON is 'Date of creation';
comment on column DM.apex_application_temp_files.BLOB_CONTENT is 'BLOB file content';
