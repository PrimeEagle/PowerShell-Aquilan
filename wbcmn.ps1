# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


$testJson = @"
{
  "id": "85yv4ny1v",
  "custom_id": "DEV-4957",
  "name": "Loader failing to load file",
  "text_content": "The Loader is not loading files. There is an entry in the EventLog table for the file but there is no entry in the ControlTotals table.  These extract files are processed by the Transformer.\n\nThe DBAs report database deadlocks on the ControlTotals table at the same time the file is loading. There is another file loading at the same time.",
  "description": "The Loader is not loading files. There is an entry in the EventLog table for the file but there is no entry in the ControlTotals table.  These extract files are processed by the Transformer.\n\nThe DBAs report database deadlocks on the ControlTotals table at the same time the file is loading. There is another file loading at the same time.",
  "status": {
    "id": "c129179779_Vq4XMDDW",
    "status": "in progress",
    "color": "#C15FDE",
    "orderindex": 2,
    "type": "custom"
  },
  "orderindex": "4373592.00000000000000000000000000000000",
  "date_created": "1674074816071",
  "date_updated": "1674239069076",
  "date_closed": null,
  "date_done": null,
  "archived": false,
  "creator": {
    "id": 57040854,
    "username": "Mark Jungman",
    "color": "#4169E1",
    "email": "mark.jungman@aquilan.com",
    "profilePicture": null
  },
  "assignees": [
    {
      "id": 57040854,
      "username": "Mark Jungman",
      "color": "#4169E1",
      "initials": "MJ",
      "email": "mark.jungman@aquilan.com",
      "profilePicture": null
    }
  ],
  "watchers": [
    {
      "id": 57040854,
      "username": "Mark Jungman",
      "color": "#4169E1",
      "initials": "MJ",
      "email": "mark.jungman@aquilan.com",
      "profilePicture": null
    },
    {
      "id": 57041654,
      "username": "Brian Hagler",
      "color": "#f57c01",
      "initials": "BH",
      "email": "brian.hagler@aquilan.com",
      "profilePicture": null
    }
  ],
  "checklists": [],
  "tags": [],
  "parent": null,
  "priority": null,
  "due_date": null,
  "start_date": null,
  "points": null,
  "time_estimate": null,
  "time_spent": 0,
  "custom_fields": [
    {
      "id": "da68ec83-2986-4711-a533-5aff2fddcc2d",
      "name": "Customer",
      "type": "labels",
      "type_config": {
        "options": [
          {
            "id": "a06254eb-6d8d-4781-8c68-46cb8c8512bc",
            "label": "Securian",
            "color": null
          },
          {
            "id": "4b13cd3d-fce1-4425-8bb0-0c2dceef63e4",
            "label": "American Fidelity",
            "color": null
          },
          {
            "id": "9d7e1f89-3df9-4aef-a883-093095a2d651",
            "label": "American General",
            "color": null
          },
          {
            "id": "781c1b5e-521e-4054-be19-bc06b07f0789",
            "label": "Great American",
            "color": null
          },
          {
            "id": "c0f52668-7f7a-4d52-b10b-68eea7649358",
            "label": "Voya",
            "color": null
          },
          {
            "id": "5221260e-14dc-456c-99e4-68f789de90b5",
            "label": "Resolution",
            "color": null
          },
          {
            "id": "42a0295f-6c41-45dc-b06b-b008066407ba",
            "label": "Venerable",
            "color": null
          },
          {
            "id": "085d93fa-717f-4a88-b460-b61fd1cfc6db",
            "label": "CNO",
            "color": null
          },
          {
            "id": "6479c641-321f-477c-a8b4-b0a70db70904",
            "label": "Pillar",
            "color": null
          },
          {
            "id": "f5504ce6-3cec-432c-9051-117dbe6c8b76",
            "label": "Talcott",
            "color": null
          },
          {
            "id": "e1c847d5-06e8-46ab-aa84-6be13c73c162",
            "label": "Genworth",
            "color": null
          },
          {
            "id": "b2776f9a-1f7b-459e-88d4-1f3a6cc95151",
            "label": "Sammons",
            "color": "#fff"
          },
          {
            "id": "65c32936-1204-4d85-8f77-cbd4c565b065",
            "label": "Americo",
            "color": "#fff"
          }
        ]
      },
      "date_created": "1664288917787",
      "hide_from_guests": false,
      "value": [ "a06254eb-6d8d-4781-8c68-46cb8c8512bc" ],
      "required": false
    },
    {
      "id": "55c37973-f8d1-4f7f-bafd-b10f75c1533c",
      "name": "Ix Bug",
      "type": "number",
      "type_config": {},
      "date_created": "1664210026306",
      "hide_from_guests": false,
      "required": false
    },
    {
      "id": "db18c623-f5f8-411e-b144-4f89352547df",
      "name": "Version",
      "type": "short_text",
      "type_config": {},
      "date_created": "1664210026297",
      "hide_from_guests": false,
      "required": false
    },
    {
      "id": "ebf11fae-5af2-4716-98dd-8ccd2c303a4c",
      "name": "iso",
      "type": "short_text",
      "type_config": {},
      "date_created": "1664555667443",
      "hide_from_guests": false,
      "required": false
    }
  ],
  "dependencies": [],
  "linked_tasks": [],
  "team_id": "45020739",
  "url": "https://app.clickup.com/t/85yv4ny1v",
  "permission_level": "create",
  "list": {
    "id": "381024825",
    "name": "List",
    "access": true
  },
  "project": {
    "id": "129179779",
    "name": "Development",
    "hidden": false,
    "access": true
  },
  "folder": {
    "id": "129179779",
    "name": "Development",
    "hidden": false,
    "access": true
  },
  "space": { "id": "63050391" },
  "attachments": [
    {
      "id": "f47e280d-cf3d-4c7d-8b3e-a16590672a99.html",
      "date": "1674235858575",
      "title": "original_email_jUjiT.html",
      "type": 2,
      "source": 1,
      "version": 0,
      "extension": "html",
      "thumbnail_small": null,
      "thumbnail_medium": null,
      "thumbnail_large": null,
      "is_folder": null,
      "mimetype": "text/html",
      "hidden": false,
      "parent_id": "90010007018462",
      "size": 14100,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/f47e280d-cf3d-4c7d-8b3e-a16590672a99/original_email_jUjiT.html",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/f47e280d-cf3d-4c7d-8b3e-a16590672a99/original_email_jUjiT.html?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/f47e280d-cf3d-4c7d-8b3e-a16590672a99/original_email_jUjiT.html"
    },
    {
      "id": "ff1484e0-cdbc-48a3-993c-e7fbc0e88e7f.txt",
      "date": "1674235858574",
      "title": "2023-01-19-QueryResults3.txt",
      "type": 2,
      "source": 1,
      "version": 0,
      "extension": "txt",
      "thumbnail_small": null,
      "thumbnail_medium": null,
      "thumbnail_large": null,
      "is_folder": null,
      "mimetype": "text/plain",
      "hidden": false,
      "parent_id": "90010007018462",
      "size": 944,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/ff1484e0-cdbc-48a3-993c-e7fbc0e88e7f/2023-01-19-QueryResults3.txt",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/ff1484e0-cdbc-48a3-993c-e7fbc0e88e7f/2023-01-19-QueryResults3.txt?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/ff1484e0-cdbc-48a3-993c-e7fbc0e88e7f/2023-01-19-QueryResults3.txt"
    },
    {
      "id": "56280090-8a98-43b3-82b1-b0e0f3da7833.txt",
      "date": "1674235858573",
      "title": "2023-01-19-QueryResults2.txt",
      "type": 2,
      "source": 1,
      "version": 0,
      "extension": "txt",
      "thumbnail_small": null,
      "thumbnail_medium": null,
      "thumbnail_large": null,
      "is_folder": null,
      "mimetype": "text/plain",
      "hidden": false,
      "parent_id": "90010007018462",
      "size": 1404,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/56280090-8a98-43b3-82b1-b0e0f3da7833/2023-01-19-QueryResults2.txt",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/56280090-8a98-43b3-82b1-b0e0f3da7833/2023-01-19-QueryResults2.txt?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/56280090-8a98-43b3-82b1-b0e0f3da7833/2023-01-19-QueryResults2.txt"
    },
    {
      "id": "73951719-765a-41d5-8a6f-27769d15d4ef.txt",
      "date": "1674235858572",
      "title": "2023-01-19-Query1Results.txt",
      "type": 2,
      "source": 1,
      "version": 0,
      "extension": "txt",
      "thumbnail_small": null,
      "thumbnail_medium": null,
      "thumbnail_large": null,
      "is_folder": null,
      "mimetype": "text/plain",
      "hidden": false,
      "parent_id": "90010007018462",
      "size": 422,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/73951719-765a-41d5-8a6f-27769d15d4ef/2023-01-19-Query1Results.txt",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/73951719-765a-41d5-8a6f-27769d15d4ef/2023-01-19-Query1Results.txt?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/73951719-765a-41d5-8a6f-27769d15d4ef/2023-01-19-Query1Results.txt"
    },
    {
      "id": "cc600fe6-244b-47ba-8536-23e4ecd69fed.png",
      "date": "1674235858571",
      "title": "image003.png",
      "type": 2,
      "source": 1,
      "version": 0,
      "extension": "png",
      "thumbnail_small": "https://t45020739.p.clickup-attachments.com/t45020739/cc600fe6-244b-47ba-8536-23e4ecd69fed_small.png",
      "thumbnail_medium": "https://t45020739.p.clickup-attachments.com/t45020739/cc600fe6-244b-47ba-8536-23e4ecd69fed/image003.png",
      "thumbnail_large": "https://t45020739.p.clickup-attachments.com/t45020739/cc600fe6-244b-47ba-8536-23e4ecd69fed/image003.png",
      "is_folder": null,
      "mimetype": "image/png",
      "hidden": false,
      "parent_id": "90010007018462",
      "size": 4372,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/cc600fe6-244b-47ba-8536-23e4ecd69fed/image003.png",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/cc600fe6-244b-47ba-8536-23e4ecd69fed/image003.png?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/cc600fe6-244b-47ba-8536-23e4ecd69fed/image003.png"
    },
    {
      "id": "62e90fed-3469-4a7d-9180-eb072b25b157.png",
      "date": "1674235858570",
      "title": "image003.png",
      "type": 2,
      "source": 1,
      "version": 0,
      "extension": "png",
      "thumbnail_small": "https://t45020739.p.clickup-attachments.com/t45020739/62e90fed-3469-4a7d-9180-eb072b25b157_small.png",
      "thumbnail_medium": "https://t45020739.p.clickup-attachments.com/t45020739/62e90fed-3469-4a7d-9180-eb072b25b157/image003.png",
      "thumbnail_large": "https://t45020739.p.clickup-attachments.com/t45020739/62e90fed-3469-4a7d-9180-eb072b25b157/image003.png",
      "is_folder": null,
      "mimetype": "image/png",
      "hidden": false,
      "parent_id": "90010007018462",
      "size": 4372,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/62e90fed-3469-4a7d-9180-eb072b25b157/image003.png",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/62e90fed-3469-4a7d-9180-eb072b25b157/image003.png?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/62e90fed-3469-4a7d-9180-eb072b25b157/image003.png"
    },
    {
      "id": "20107207-c261-4dfc-a2c0-5573077fa191.png",
      "date": "1674235858569",
      "title": "image003.png",
      "type": 2,
      "source": 1,
      "version": 0,
      "extension": "png",
      "thumbnail_small": "https://t45020739.p.clickup-attachments.com/t45020739/20107207-c261-4dfc-a2c0-5573077fa191_small.png",
      "thumbnail_medium": "https://t45020739.p.clickup-attachments.com/t45020739/20107207-c261-4dfc-a2c0-5573077fa191/image003.png",
      "thumbnail_large": "https://t45020739.p.clickup-attachments.com/t45020739/20107207-c261-4dfc-a2c0-5573077fa191/image003.png",
      "is_folder": null,
      "mimetype": "image/png",
      "hidden": false,
      "parent_id": "90010007018462",
      "size": 4372,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/20107207-c261-4dfc-a2c0-5573077fa191/image003.png",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/20107207-c261-4dfc-a2c0-5573077fa191/image003.png?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/20107207-c261-4dfc-a2c0-5573077fa191/image003.png"
    },
    {
      "id": "8ffde818-d7af-4177-9087-f2b50e837ab7.jpg",
      "date": "1674235858568",
      "title": "image001.jpg",
      "type": 2,
      "source": 1,
      "version": 0,
      "extension": "jpg",
      "thumbnail_small": "https://t45020739.p.clickup-attachments.com/t45020739/8ffde818-d7af-4177-9087-f2b50e837ab7_small.jpg",
      "thumbnail_medium": "https://t45020739.p.clickup-attachments.com/t45020739/8ffde818-d7af-4177-9087-f2b50e837ab7_medium.jpg",
      "thumbnail_large": "https://t45020739.p.clickup-attachments.com/t45020739/8ffde818-d7af-4177-9087-f2b50e837ab7/image001.jpg",
      "is_folder": null,
      "mimetype": "image/jpeg",
      "hidden": false,
      "parent_id": "90010007018462",
      "size": 40863,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/8ffde818-d7af-4177-9087-f2b50e837ab7/image001.jpg",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/8ffde818-d7af-4177-9087-f2b50e837ab7/image001.jpg?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/8ffde818-d7af-4177-9087-f2b50e837ab7/image001.jpg"
    },
    {
      "id": "ff8a5a79-b076-4c82-a236-920e2266986f.html",
      "date": "1674074814695",
      "title": "original_email_fT72U.html",
      "type": 1,
      "source": 1,
      "version": 0,
      "extension": "html",
      "thumbnail_small": null,
      "thumbnail_medium": null,
      "thumbnail_large": null,
      "is_folder": null,
      "mimetype": "text/html",
      "hidden": false,
      "parent_id": "85yv4ny1v",
      "size": 11067,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/ff8a5a79-b076-4c82-a236-920e2266986f/original_email_fT72U.html",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/ff8a5a79-b076-4c82-a236-920e2266986f/original_email_fT72U.html?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/ff8a5a79-b076-4c82-a236-920e2266986f/original_email_fT72U.html"
    },
    {
      "id": "2decac44-7056-419a-879f-d3687541e739.txt",
      "date": "1674074814682",
      "title": "logExcerpt11-29.txt",
      "type": 1,
      "source": 1,
      "version": 0,
      "extension": "txt",
      "thumbnail_small": null,
      "thumbnail_medium": null,
      "thumbnail_large": null,
      "is_folder": null,
      "mimetype": "text/plain",
      "hidden": false,
      "parent_id": "85yv4ny1v",
      "size": 3505,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/2decac44-7056-419a-879f-d3687541e739/logExcerpt11-29.txt",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/2decac44-7056-419a-879f-d3687541e739/logExcerpt11-29.txt?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/2decac44-7056-419a-879f-d3687541e739/logExcerpt11-29.txt"
    },
    {
      "id": "30aaf2dd-c18e-4736-b7a2-7d7f5c2bab8b.txt",
      "date": "1674074814663",
      "title": "queryResultsExcerpt11-29.txt",
      "type": 1,
      "source": 1,
      "version": 0,
      "extension": "txt",
      "thumbnail_small": null,
      "thumbnail_medium": null,
      "thumbnail_large": null,
      "is_folder": null,
      "mimetype": "text/plain",
      "hidden": false,
      "parent_id": "85yv4ny1v",
      "size": 1723,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/30aaf2dd-c18e-4736-b7a2-7d7f5c2bab8b/queryResultsExcerpt11-29.txt",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/30aaf2dd-c18e-4736-b7a2-7d7f5c2bab8b/queryResultsExcerpt11-29.txt?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/30aaf2dd-c18e-4736-b7a2-7d7f5c2bab8b/queryResultsExcerpt11-29.txt"
    },
    {
      "id": "b3a6acf0-350f-40f9-8e3b-1472df684724.png",
      "date": "1674074814647",
      "title": "image001.png",
      "type": 1,
      "source": 1,
      "version": 0,
      "extension": "png",
      "thumbnail_small": "https://t45020739.p.clickup-attachments.com/t45020739/b3a6acf0-350f-40f9-8e3b-1472df684724_small.png",
      "thumbnail_medium": "https://t45020739.p.clickup-attachments.com/t45020739/b3a6acf0-350f-40f9-8e3b-1472df684724/image001.png",
      "thumbnail_large": "https://t45020739.p.clickup-attachments.com/t45020739/b3a6acf0-350f-40f9-8e3b-1472df684724/image001.png",
      "is_folder": null,
      "mimetype": "image/png",
      "hidden": false,
      "parent_id": "85yv4ny1v",
      "size": 4372,
      "total_comments": 0,
      "resolved_comments": 0,
      "user": {
        "id": 57040854,
        "username": "Mark Jungman",
        "email": "mark.jungman@aquilan.com",
        "initials": "MJ",
        "color": "#4169E1",
        "profilePicture": null
      },
      "deleted": false,
      "orientation": null,
      "url": "https://t45020739.p.clickup-attachments.com/t45020739/b3a6acf0-350f-40f9-8e3b-1472df684724/image001.png",
      "email_data": null,
      "url_w_query": "https://t45020739.p.clickup-attachments.com/t45020739/b3a6acf0-350f-40f9-8e3b-1472df684724/image001.png?view=open",
      "url_w_host": "https://t45020739.p.clickup-attachments.com/t45020739/b3a6acf0-350f-40f9-8e3b-1472df684724/image001.png"
    }
  ]
}

"@;

$localConfigFile = join-path $PSScriptRoot "wbconf.ps1"
if(Test-Path ($localConfigFile)) {
. $localConfigFile
} else {
    Write-Host "Error: " -ForegroundColor 'Red' -NoNewline;
    "Could not open file wbconf.ps1; this file is required and should be located in the Workbench bin directory"
''
"Example content for $localConfigFile"
$exampleConfigFile = $localConfigFile + ".example"
if(Test-Path ($exampleConfigFile)) {
Get-Content $exampleConfigFile | Write-Host
}
else {
''
''
'# -----------------------------------------------------------------------------'
'# -----------------------------------------------------------------------------'
''
'$basepathPrivate               = "D:\wb\"'
'$assetsPrivate                 = "D:\wb\assets\"'
'$dbServerPrivate               = ".\sql2014"'
'$dbAdminUser                   = "sa"'
'$dbAdminPass                   = "sa"'
'$itUser                        = "username@aquilan.com"'
'$itPass                        = "password"'
'$buildExePrivate               = ".\BuildTools\DevTools\nant-0.90\bin\NAnt.exe"'
'$devenvPrivate                 = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\devenv.exe"'
"$iisExpressExe                 = 'C:\Program Files (x86)\IIS Express\iisexpress.exe'"
'$applicationHostConfigPrivate  = "C:\Program Files (x86)\IIS Express\AppServer\applicationhost.config"'
'$ssmsPrivate                   = "C:\Program Files (x86)\Microsoft SQL Server\140\Tools\Binn\ManagementStudio\Ssms.exe"'
'$svnTortoiseProcExe            = "C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe"'
'$portNumberPrivate             = 8080'
'$svnUrlPrivate                 = "https://bld00.aquilan.atx/svn/aquilan/branches/"'
"$svnTagsUrlPrivate             = 'https://bld00.aquilan.atx/svn/aquilan/tags"
'$issueTrackerUrl               = "http://bld00.aquilan.atx/IssueTracker/default.asp"'
'$issueTrackerApi               = "http://bld00.aquilan.atx/IssueTracker/api.asp"'
''
'# -----------------------------------------------------------------------------'
}
}
# -----------------------------------------------------------------------------



function Get-SrcDir {
    return $basepathPrivate;
}
# -----------------------------------------------------------------------------


function Get-AssetsDir {
    return $assetsPrivate;
}
# -----------------------------------------------------------------------------


function Get-DbServer {
    return $dbServerPrivate
}
# -----------------------------------------------------------------------------


function Get-DbAdminUser {
    return $dbAdminUser
}
# -----------------------------------------------------------------------------


function Get-DbAdminPass {
    return $dbAdminPass
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


function Get-SvnUrl {
    return $svnUrlPrivate;
}
# -----------------------------------------------------------------------------


function Get-VisualStudioPath {
    return $devenvPrivate;
}
# -----------------------------------------------------------------------------


function Get-SsmsPath {
    return $ssmsPrivate;
}
# -----------------------------------------------------------------------------


function Get-DefaultApplicationHostConfigFilename {
    return $applicationHostConfigPrivate;
}
# -----------------------------------------------------------------------------


function Get-CaseAndVersion($path) {
    $caseAndVersion = $path.ToString().Replace($basepathPrivate, "").Split('\')[0];
    return $caseAndVersion;
}
# -----------------------------------------------------------------------------


function Get-CaseNumber($path) {
    $caseAndVersion = Get-CaseAndVersion $path
    $casePart = $caseAndVersion.Split("_")[0]
    $caseNumber = $casePart.Replace("c", "")
    return $caseNumber;
}


function Get-TaskId($path) {
    # $caseAndVersion = Get-CaseAndVersion $path
    # $casePart = $caseAndVersion.Split("_")[0]
    # $caseNumber = $casePart.Replace("c", "")
    # return $caseNumber;

    
    $topPath = Get-CaseTopDirectory($path);
    # $caseNumber = Get-CaseNumber($topPath);

    $caseInfo = [System.IO.Path]::GetFullPath($topPath + "/caseinfo.xml");    
    if((Test-Path $caseInfo)) {
        $rv = Get-CaseNumber($path)        
    } else {
        $caseInfo = [System.IO.Path]::GetFullPath($topPath + "/caseinfo.json");
        $file = Get-Item ($caseInfo)
        $json = Get-Content $file  | ConvertFrom-JSON
        $rv = $json.id
    }
    $rv 
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


function Get-CaseTopDirectory($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $appPath = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion);
    return $appPath;
}
# -----------------------------------------------------------------------------


function Get-CaseWorkDirectory($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $caseNumber = Get-CaseNumber $path;
    $appPath = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion);
    $workPath = "${appPath}/scripts/cases/c${caseNumber}"
    return $workPath;
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


function AppDirectory($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $appPath = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion + "/PatriotManager");
    return $appPath;
}
# -----------------------------------------------------------------------------


function Test-WebExe($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $appPath = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion + "/PatriotManager/bin/Aquilan.Web.dll");
    if(-not (Test-Path $appPath)) {
        WriteError "cannot find web exe, file: ${appPath}"
        exit 7;
    }
    if(-not (Test-Path $applicationHostConfigPrivate)) {
        WriteError "cannot find web config file, file: ${applicationHostConfigPrivate}"
        exit 7;
    }
}
# -----------------------------------------------------------------------------


function Test-AqsRunning($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $ProcessRunning = Get-Process | Where-Object {$_.Path -like "*$CaseAndVersion*"}  
    if($ProcessRunning.Length -eq 0) {
        WriteError 'Aquilan Service is not running; try command goaqs.'
        exit 3
    }
}
# -----------------------------------------------------------------------------

function Get-DatabaseDirectory($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $appPath = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion + "/database/Scripts");
    return $appPath;
}
# -----------------------------------------------------------------------------


function Get-LogDirectory($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $appPath = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion + "/log");
    return $appPath;
}
# -----------------------------------------------------------------------------


function Get-ServiceExe($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $appPath = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion + "/Aquilan.Service/bin/Aquilan.Service.exe");
    if(-not (Test-Path $appPath)) {
        WriteError "cannot find Aquilan.Service.exe, file: ${appPath}"
        exit 7;
    }
    return $appPath;
}
# -----------------------------------------------------------------------------


function Get-BuildExe($path) {
    $buildExe = $buildExePrivate;
    $caseAndVersion = Get-CaseAndVersion $path;
    $appPath = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion + $buildExe)
    if(-not (Test-Path $appPath)) {
        WriteError "cannot find build executeable (nant), file: ${appPath}"
        exit 7;
    }
    return $appPath;
}
# -----------------------------------------------------------------------------


function Get-MsBuildExe($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $appPath = [System.IO.Path]::GetFullPath($msbuildPrivate)
    if(-not (Test-Path $appPath)) {
        WriteError "cannot find build executeable (msbuild), file: ${appPath}"
        exit 7;
    }
    return $appPath;
}
# -----------------------------------------------------------------------------


function Get-TscExe($path) {
    $path = Get-CaseTopDirectory($path);
    $tscSearch = "$path/packages/Microsoft.TypeScript.Compiler.*/tools/tsc.exe";
    $tsc = get-item $tscSearch
    if($tsc.count -eq 0) {  return $tscSearch;  }
    return $tsc[$tsc.count-1];
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


function Set-AppConfig($path) {


    # -----------------------------------------------------------------------------
    # Copy App.config.example to App.config
    #


    Get-ChildItem -Path ${path}\ -Filter App.config.example -Recurse -File -Name| ForEach-Object {
        $srcFile = "${path}\" + $_
        $appDir = [System.IO.Path]::GetDirectoryName($srcFile);
        $noExt = [System.IO.Path]::GetFileNameWithoutExtension($srcFile);
        $targetAppFile = $appDir + '\' + $noExt;
        if(-not (Test-Path($targetAppFile))) {
            Copy-Item $srcFile $targetAppFile
        }
    }
    # -----------------------------------------------------------------------------
    # Aquilan.Service\App.config
    #
    #
    # database			- $caseNumber
    # log directory
    # connectionstring
    #	server			- $dbServer 
    #	database		- $caseNumber
    # ConfigItem
    #	SourceFolder	 - $path + "\log\"
    #	HistoryFolder	 - $path + "\log\"
    #	ErrorFolder


    $file = Get-Item ($path + "\Aquilan.Service\App.config")
    [xml]$xml = Get-Content $file

    $xml.SelectNodes('//appSettings/add[@key="Database"]/@value')[0].'#text'     = $dbName 
    $xml.SelectNodes('//appSettings/add[@key="LogDirectory"]/@value')[0].'#text' = $path + "\log"
    $xml.SelectNodes('//connectionStrings/add[@name="apm"]/@connectionString')[0].'#text' = "Persist Security Info=False;server=$dbServer;database=$dbName;user id=apm;password=Qo9ajs"

    $xml.SelectNodes('//ConfigItem[@BusinessUnitCode="101"]/SourceFolder')[0].'#text'  = $path + "\log\101source"
    $xml.SelectNodes('//ConfigItem[@BusinessUnitCode="201"]/SourceFolder')[0].'#text'  = $path + "\log\201source"
    $xml.SelectNodes('//ConfigItem[@BusinessUnitCode="101"]/ErrorFolder')[0].'#text'   = $path + "\log\error"
    $xml.SelectNodes('//ConfigItem[@BusinessUnitCode="201"]/ErrorFolder')[0].'#text'   = $path + "\log\error"
    $xml.SelectNodes('//ConfigItem[@BusinessUnitCode="101"]/HistoryFolder')[0].'#text' = $path + "\log\history"
    $xml.SelectNodes('//ConfigItem[@BusinessUnitCode="201"]/HistoryFolder')[0].'#text' = $path + "\log\history"

    $xml.Save($file.FullName)
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


function Get-101SourceDirectory($path) {
    $sourceDir = (Get-CaseTopDirectory $path) + "/log/101source"
        if(-not (Test-Path $sourceDir)) {
            WriteError "cannot find the 101source Loader directory, is the service running"
            exit 6
        }
    $sourceDir
}
# -----------------------------------------------------------------------------


function Get-BulkDirectory($path) {
    $bulkDir = (Get-CaseTopDirectory $path) + "/log/bulk"
    if(-not (Test-Path $bulkDir)) {
        $bulkDir = (Get-CaseTopDirectory $path) + "/log/101source/bulk"
        if(-not (Test-Path $bulkDir)) {
            WriteError "cannot find the bulk Loader directory, is the service running"
            exit 6
        }
    }
    $bulkDir
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


function IssueTrackerApi {
    return $issueTrackerApi;
}
# -----------------------------------------------------------------------------


function IssueTracker {
    return $issueTrackerUrl;
}
# -----------------------------------------------------------------------------


function Get-IssueTrackerUser {
    return $itUser
}
# -----------------------------------------------------------------------------


function Get-IssueTrackerPass {
    return $itPass
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


function Get-ApmUser {
    return $apmUser
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


function Get-AppPortNumber {
    return $portNumberPrivate;
}
# -----------------------------------------------------------------------------


function IsValidDirectory($path) {
    $caseAndVersion = Get-CaseAndVersion $path;
    $caseInfo = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion + "/caseinfo.xml");
    $rv = (Test-Path $caseInfo)
    if(-not $rv) {
        $caseInfo = [System.IO.Path]::GetFullPath($basepathPrivate + "/" + $caseAndVersion + "/caseinfo.json");
        $rv = (Test-Path $caseInfo)
    }
    $rv
}
# -----------------------------------------------------------------------------


function Get-CaseTitle($path) {

    $topPath = Get-CaseTopDirectory($path);
    $caseNumber = Get-CaseNumber($topPath);

    $caseInfo = [System.IO.Path]::GetFullPath($topPath + "/caseinfo.xml");    
    if((Test-Path $caseInfo)) {
        $file = Get-Item ($caseInfo)
        [xml]$xml = Get-Content $file
        $title = $xml.SelectNodes('//cases/case/sTitle').InnerText
        
    } else {
        $caseInfo = [System.IO.Path]::GetFullPath($topPath + "/caseinfo.json");
        $file = Get-Item ($caseInfo)
        $json = Get-Content $file  | ConvertFrom-JSON
        $title = $json.name
    }
    "Case ${caseNumber}: ${title}"
}
# -----------------------------------------------------------------------------


function TestValidDirectory {
    if($PSVersionTable.PSVersion.Major -lt 6) {
        $currentVersion = $PSVersionTable.PSVersion.Major;
        $currentVersion += "." + $PSVersionTable.PSVersion.Minor;
        WriteError "Unsupported version of PowerShell, version 6 or better.  Current version: ${currentVersion}"
        exit 6
    }

    $valid = IsValidDirectory (Get-Location)
    if(-not $valid)
    {
        WriteError "invalid directory; not a Workbench context directory"
        exit 5;
    }
}
# -----------------------------------------------------------------------------


function Get-ScriptName {
        $scriptName = [io.path]::GetFileNameWithoutExtension((split-path $script:MyInvocation.MyCommand.Name -Leaf));
        return $scriptName;
}
# -----------------------------------------------------------------------------


function Show-Help {
    Param([string]$summaryHelp, 
          [string]$detailHelp)


    $args = $script:MyInvocation.UnboundArguments
    if(($args[0] -eq "-h" -or $args[0] -eq "/?" -or $args[0] -eq "/h") -and $detailHelp.Length -gt 0) {
        $scriptName1 = Get-ScriptName;
        $scriptName = $scriptName1.PadRight(9, " ");
        "${scriptName} - ${summaryHelp}";
        "          - ${detailHelp}";
        exit 0;
    } elseif($args[0] -eq "-hh" -or (($args[0] -eq "-h" -or $args[0] -eq "/?" -or $args[0] -eq "/h") -and $detailHelp.Length -eq 0)) {
        $scriptName1 = Get-ScriptName;
        $scriptName = $scriptName1.PadRight(9, " ");
        "    ${scriptName} - ${summaryHelp}";
        exit 0;
    }
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

function Get-DateTime {
    return (Get-Date).ToString("o").substring(0, 23);
}
# -----------------------------------------------------------------------------


function WriteLog([string]$logfilename, [string]$message)
{
    $logMessage = "$(Get-DateTime)| $message"
    $logMessage | out-file -append $logfilename
    $logMessage # | tee -append $logfilename
}
# -----------------------------------------------------------------------------


function WriteStatus([string]$logfilename, [string]$message)
{
    $logMessage = "$(Get-DateTime)| $message"
    $logMessage | out-file -append $logfilename
    $logMessage # | tee -append $logfilename
}
# -----------------------------------------------------------------------------


function WriteStatusWithDuration([string]$logfilename, [string]$message, [System.Diagnostics.Stopwatch]$sw)
{
    $logMessage = "$(Get-DateTime)| ts: $($sw.Elapsed.ToString("d\:hh\:mm\:ss\.fff")); $message"
    $logMessage | out-file -append $logfilename
    $logMessage # | tee -append $logfilename
}
# -----------------------------------------------------------------------------


function WriteError([string]$message)
{
    Write-Host "$(Get-DateTime)| " -NoNewline
    Write-Host "Error: " -ForegroundColor 'Red' -NoNewline;
    Write-Host $message;
    $frequency = 500;
    $durationMS = 250;
    [console]::Beep($frequency, $durationMS);
}
# -----------------------------------------------------------------------------


function SetPowerShellTabLabel([string]$message)
{
    $caseAndVersion = Get-CaseAndVersion (Get-Location)
    $title = if($message) { $message + ' - ' + $caseAndVersion } else { $caseAndVersion }
    $host.ui.RawUI.WindowTitle = $title; 
}
# -----------------------------------------------------------------------------



function Get-ExecuteScriptAsAdmin($path) {
    if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
    { 
        Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$path`"" -Verb RunAs; 
    }
}
# -----------------------------------------------------------------------------


function Get-ExecuteCommandAsAdmin($path, $cmd) {
    if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
    { 
        $runcmd = "Start-Process 'cmd' -Verb RunAs -WorkingDirectory $path -ArgumentList `"/c $cmd`"  ";
        $runcmd
        #Start-Process powershell.exe -Command $runcmd
        powershell.exe -WorkingDirectory $path -Command "$runcmd"
    }
}
# -----------------------------------------------------------------------------


function Import-DatabaseScriptDirectoryExists($loadDir, $loadArg, $message) {
    $path = Get-CaseTopDirectory(Get-Location);
    $targetPath = [System.IO.Path]::GetFullPath($path + "/database/$loadDir");
    if(-not (Test-Path $targetPath)) {
        SetPowerShellTabLabel; 
        exit 0;  # silent exit; why silent?
    }
}
# -----------------------------------------------------------------------------


function Get-LatestDatabaseLogFile() {
#   $rv = Get-ChildItem "$path/log/database*.log" | Sort-Object LastWriteTime | Select-Object -last 1
    $path = Get-CaseTopDirectory(Get-Location);
    $rv = Get-ChildItem "${path}\log\database*.log" | Sort-Object LastWriteTime | Where-Object {$_.Name -ne "database.log"} | Select-Object -last 1
    return $rv;
}
# -----------------------------------------------------------------------------


function Import-DatabaseScripts($loadDir, $loadArg, $message) {
    
    $path = Get-CaseTopDirectory(Get-Location);
    $targetPath = [System.IO.Path]::GetFullPath($path + "/database/$loadDir");
    $aqs = Get-ServiceExe(Get-Location)
    $logFile = "$path/log/database_$([System.DateTime]::Now.ToString("yyyy-MM-ddTHH_mm_ss.fff")).log"
    write-host -NoNewline '' | out-file -encoding ascii  $logFile 

    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    WriteStatus $logFile $message
    WriteStatus $logFile "Writing log to file $logFile"

    & $aqs $loadArg $targetPath | out-file -Append -encoding ascii $logFile
    if($LASTEXITCODE -ne 0) {
        
#        $logfile = Get-ChildItem "$path/log/database*.log" | Sort-Object LastWriteTime | Select-Object -last 1
        WriteError "$statusMessage; see $logFile";
        SetPowerShellTabLabel 'error'
        exit 1
    }

    $sw.Stop();
    WriteStatusWithDuration $logFile $message  $sw
}
# -----------------------------------------------------------------------------


function Remove-Database($logfile, $db){
    
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    WriteStatus $logFile "dropping table [$db]"


# add check for db existence before dropping
$sql = @"
use master;
if (exists (select *
  from master.dbo.sysdatabases
  where name = '${db}'))
begin
    alter database [${db}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    drop database [${db}];
end
"@;


    & sqlcmd -S $dbServerPrivate -U $dbAdminUser -P $dbAdminPass -d master -t 5 -Q "$sql" 


    $sw.Stop();
    WriteStatusWithDuration $logfile "dropping table [$db]"  $sw
}
# -----------------------------------------------------------------------------


Function Start-IISExpress 
{
    $caseAndVersion = Get-CaseAndVersion(Get-Location)
    $basePath = Get-SrcDir;
    $portNumber = Get-AppPortNumber
#    $jobName = "APM_" + $portNumber
    $appHostFile = $basePath + "iisexpress_applicationhost.config"

    ConfigureApplicationHostConfig $appHostFile $caseAndVersion  $portNumber


    $iisProcess = get-Process -name 'iisexpress' -ErrorAction SilentlyContinue
    if($null -ne $iisProcess) { $iisProcess | stop-process -force }
    start-process $iisExpressExe -argumentList "/config:$appHostFile" -WindowStyle minimized
    start-sleep -s 1
}
# -----------------------------------------------------------------------------


function FilesToCommitCount($path)
{
	[int]$rv = 0;
  $dir = Get-CaseTopDirectory($path)
	$filestatus = svn st -q $dir
	foreach($f in  $filestatus)
	{
		if(IgnoreFileForCount $f) { continue; }
		$rv++;
	}
	return $rv
}
# -----------------------------------------------------------------------------

function FilesToCommit($dir)
{
	#  $base = Get-SrcDir
	$rv = '';  #  [System.IO.Path]::GetFullPath($base + "/" + $dir.Name + "/caseinfo.xml") + "`n";
	$filestatus = svn st -q $dir
	foreach($f in  $filestatus)
	{
		if(IgnoreFile($f)) {  continue;  }
		$rv += "    " + $f.substring(8, $f.length-8) + "  ```n";
	}
	return $rv
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

class CaseStatus 
{
    [int]$index
    [string]$invokeCommand
    [string]$caseNumber
    [string]$fullPath
    [string]$displayPath
    [string]$assignee = '--'
    [string]$status = '--'
    [string]$customer = '--'
    [int]$filesToCommit = 0
}
# -----------------------------------------------------------------------------


function Get-CaseStatusFromList (
    [Parameter(Mandatory=$true)][string]$showDetails = 'xxx',
    [Parameter(Mandatory=$true)][System.Collections.ArrayList]$caseList
    )
{
   if($showDetails -eq '-d') {

      $caseList | foreach-object -parallel {
          $case = $_;
          if($case.index -gt 0) {
                $cmd = $case.invokeCommand
                  $argsX = @()
                  $argsX += ($case.fullPath)
                  $caseX = Invoke-Expression "$cmd $argsX"

                  $case.caseNumber = $caseX.caseNumber
                  $case.displayPath = $caseX.displayPath
                  $case.assignee = $caseX.assignee
                  $case.status = $caseX.status
                  $case.customer = $caseX.customer
                  $case.filesToCommit = $caseX.filesToCommit
          }
      }
  }
  else {
          $caseList | ForEach-Object {
              $case = $_;
              if($case.index -gt 0) {
                $caseTitle = Get-CaseTitle $case.fullPath;
                $caseNumber = $caseTitle.substring(5, 4)
                $case.caseNumber = $caseNumber
                $caseTitleLen = $caseTitle.Length -gt 95 ? 95 : $caseTitle.Length;
                $case.displayPath =  $case.fullPath.substring(0, $len), $caseTitle.substring(0, $caseTitleLen);
             }
         }
    }
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


function Get-CaseStatus ([Parameter(Mandatory=$true)][string]$caseNumber)
{

        $rv = New-Object CaseStatus
        $rv.caseNumber = $caseNumber;
        $rv.assignee = '--';
        $rv.status = '--';

		if($caseNumber -gt 4000)
		{
			# --------------------------------------------------------------------


			$caseUrl   = IssueTrackerApi
			$loginCred = Get-IssueTrackerPass
			$loginTeamId = Get-IssueTrackerUser

			$caseNumber = $caseNumber -replace 'DEV-', ''
			$itLoginUrl = $caseUrl + 'DEV-' + $caseNumber + '?custom_task_ids=true&team_id=' + $loginTeamId


			$Header = @{
				'Authorization' = $loginCred
			}


			try { $response = Invoke-WebRequest -Uri  $itLoginUrl -ContentType 'application/json' -Headers $Header }
			catch {	
				if($_.Exception.Message -ne 'Response status code does not indicate success: 404 (Not Found).') 
				{
					WriteError $_.Exception.Message
    				WriteError 'Perhaps invalid task id'
				    exit 1
			    }
		    }


			$errorCode = $response.response.error.code
			if($errorCode -gt 0) {
				$errorText = $xml.response.error.InnerText
				$errorText
				WriteError "Failed to login to ClickUp - error code: $errorCode - $errorText"
				exit 1
			}



            if($null -ne $response.Content)
            {
                $json = ConvertFrom-JSON $response.Content 
                $title2=$json.name
                if($title2.Length -eq 0) {
                    WriteError "Case number not found in ClickUp: case - ${caseNumber}; no action taken"
                    exit 1
                }

                $rv.status = $json.status.status.ToLower();
                if($rv.status.length -gt 11) {
                    $rv.status = $rv.status.substring(0, 11)
                }

                if( $json.assignees.length -gt 0) {
                    $rv.assignee = $json.assignees | Sort-Object -Property initials | join-string  {$_.initials}  -Separator '/'
                }
				
				
				if( $json.custom_fields.length -gt 0) {					
					foreach($field in $json.custom_fields) {
						if($field.name = "Customer") {
							if($field.value.length -gt 0) {
								$customerId = $field.value[0];			# possibly loop thru to get all; but display space is small, so 						
								foreach($customer in $field.type_config.options) {
									if($customer.id -eq $customerId) {
										$rv.customer = $customer.label										
										if($customer.label.length -gt 15) {
										    $rv.customer = $customer.label.substring(0, 15)
										}										
									}
								}								
							}
						}
					}
				}
            }
		}

        return $rv;
}
# -----------------------------------------------------------------------------


function ConfigureApplicationHostConfig (
    [Parameter(Mandatory=$true)][string]$appHostFile = "NotSet",
    [Parameter(Mandatory=$true)][string]$caseAndVersion = "NotSet",
    [Parameter(Mandatory=$true)][string]$port = "8080"
)
{ 
#    $appPath = @"
#				<application path="/$caseAndVersion" >
#					<virtualDirectory path="/" physicalPath="$basePath\$caseAndVersion\PatriotManager" />
#				</application>
#"@

    $physicalPath = AppDirectory (Get-Location);
    if(Test-Path $appHostFile) {
        $filename = $appHostFile
    }
    else {
       $filename = Get-DefaultApplicationHostConfigFilename; 
    }

    [xml]$xml = get-content $filename
    $app = $xml.SelectSingleNode("//application[@path='/$caseAndVersion']")
    if($null -eq $app) {
        $binding = $xml.SelectSingleNode("//sites/site[@id=1]/bindings/binding[@protocol='http']")
        $bindingInfo = ":" + $port + ":localhost"
        $binding.SetAttribute("bindingInformation", $bindingInfo)

        $site = $xml.SelectSingleNode("//sites/site[@id=1]")

        $child = $xml.CreateElement("application")
        $child.SetAttribute("path", "/$caseAndVersion")
        $vd = $xml.CreateElement("virtualDirectory")
        $vd.SetAttribute("path", "/")
        $vd.SetAttribute("physicalPath", $physicalPath)
        $notused = $site.AppendChild($child)
        $notused = $child.AppendChild($vd) 
        $notused > $null

        $xml.Save($appHostFile)
    }
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

function IgnoreFileForCount($f)
{ 
    if($f.StartsWith('!')) {  return $true; }

    $caseNumber = Get-CaseNumber($f);
    $clean = ($f -replace '^.\w*', '').Trim();
    $queriesFile = resolve-path (Get-CaseWorkDirectory($clean + '\queries.sql')).ToString();
    $extractFile = resolve-path (Get-CaseWorkDirectory($clean + '\extracts1.txt')).ToString();

    if($f -eq $queriesFile) {  return $true; }
    elseif($f -eq $extractFile) {  return $true; }
    elseif($f.EndsWith('\c' + $caseNumber)) { return $true; }
    elseif($f.EndsWith('caseinfo.json')) {  return $true; }
#    elseif($f.EndsWith('database\Scripts\common.cmd')) {  return $true; }
#    elseif($f.EndsWith('config.build')) {  return $true; }
   elseif($f.EndsWith('ActiveRecord-DA.cs')) {  return $true; }
   elseif($f.EndsWith('ActiveRecord-DTO.cs')) {  return $true; }
   elseif($f.EndsWith('ActiveRecord.ts')) {  return $true; }

    elseif($f.EndsWith('Aquilan.DataAccess\ActiveRecord\ActiveRecord-DA.cs')) {  return $true; }
    elseif($f.EndsWith('Aquilan.DataTransferObject\ActiveRecord\ActiveRecord-DTO.cs')) {  return $true; }
#    elseif($f.EndsWith('PatriotManager\PatriotManager.csproj')) {  return $true; }
#    elseif($f.EndsWith('PatriotManager\web.connectionStrings.config')) {  return $true; }
    elseif($f.EndsWith('.sln')) {  return $true; }

    return $false;
}
# -----------------------------------------------------------------------------

function IgnoreFile($f)
{
    if($f.StartsWith('!')) {  return $true; }
#    elseif($f.EndsWith('App.config')) {  return $true; }
    elseif($f.EndsWith('caseinfo.xml')) {  return $true; }
    elseif($f.EndsWith('caseinfo.json')) {  return $true; }
#    elseif($f.EndsWith('database\Scripts\common.cmd')) {  return $true; }
#    elseif($f.EndsWith('config.build')) {  return $true; }
#   elseif($f.EndsWith('ActiveRecord-DA.cs')) {  return $true; }
#   elseif($f.EndsWith('ActiveRecord-DTO.cs')) {  return $true; }
#   elseif($f.EndsWith('ActiveRecord.ts')) {  return $true; }

#    elseif($f.EndsWith('Aquilan.DataAccess\ActiveRecord\ActiveRecord-DA.cs')) {  return $true; }
#    elseif($f.EndsWith('Aquilan.DataTransferObject\ActiveRecord\ActiveRecord-DTO.cs')) {  return $true; }
#    elseif($f.EndsWith('PatriotManager\PatriotManager.csproj')) {  return $true; }
#    elseif($f.EndsWith('PatriotManager\web.connectionStrings.config')) {  return $true; }
    elseif($f.EndsWith('.sln')) {  return $true; }

    return $false;
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


#    function AppDirectory($path) {
#    function Get-101SourceDirectory($path) {
#    function Get-AppPortNumber {
#    function Get-AssetsDir {
#    function Get-BuildExe($path) {
#    function Get-BulkDirectory($path) {
#    function Get-CaseAndVersion($path) {
#    function Get-CaseNumber($path) {
#    function Get-CaseTitle($path) {
#    function Get-CaseTopDirectory($path) {
#    function Get-CaseWorkDirectory($path) {
#    function Get-DatabaseDirectory($path) {
#    function Get-DateTime {
#    function Get-DbAdminPass {
#    function Get-DbAdminUser {
#    function Get-DbServer {
#    function Get-DefaultApplicationHostConfigFilename {
#    function Get-ExecuteCommandAsAdmin($path, $cmd) {
#    function Get-ExecuteScriptAsAdmin($path) {
#    function Get-IssueTrackerPass {
#    function Get-IssueTrackerUser {
#    function Get-LogDirectory($path) {
#    function Get-ScriptName {
#    function Get-ServiceExe($path) {
#    function Get-SrcDir {
#    function Get-SsmsPath {
#    function Get-SvnUrl {
#    function Get-VisualStudioPath {
#    function IgnoreFile($f)
#    function Import-DatabaseScripts($loadDir, $loadArg, $message) {
#    function IssueTracker {
#    function IssueTrackerApi {
#    function IsValidDirectory($path) {
#    function Remove-Database($logfile, $db){
#    function SetPowerShellTabLabel
#    function Show-Help {
#    function TestValidDirectory {
#    function Test-WebExe($path) {
#    function WriteError([string]$message)
#    function WriteLog([string]$logfilename, [string]$message)
#    function WriteStatus([string]$logfilename, [string]$message)
#    function WriteStatusWithDuration([string]$logfilename, [string]$message, [System.Diagnostics.Stopwatch]$sw)


# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

