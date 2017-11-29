helpdesk_user_environment:
  file: 
    - name: /opt/helpdesk
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771

scripts_path:
  file:
    - name: /opt/helpdesk/scripts
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771

logs_path:
  file:
    - name: /opt/helpdesk/logs
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771

backup_environment_dh:
  file:
    - name: /mnt/takeouts/DH
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771
    - makedirs: True

backup_environment_foodora:
  file:
    - name: /mnt/takeouts/FOODORA
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771
    - makedirs: True

backup_environment_foodpanda:
  file:
    - name: /mnt/takeouts/FOODPANDA
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771
    - makedirs: True

encryption_backup_environement_dh:
  file:
    - name: /mnt/takeouts2/backups/DH
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771
    - makedirs: True

encryption_backup_environement_foodora:
  file:
    - name: /mnt/takeouts2/backups/FOODORA
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771
    - makedirs: True

encryption_backup_environement_foodpanda:
  file:
    - name: /mnt/takeouts2/backups/FOODPANDA
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771
    - makedirs: True

encryption_environment_dh:
  file:
    - name: /mnt/takeouts2/uploads/DH
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771
    - makedirs: True

encryption_environment_foodora:
  file:
    - name: /mnt/takeouts2/uploads/FOODORA
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771
    - makedirs: True

encryption_environment_foodpanda:
  file:
    - name: /mnt/takeouts2/uploads/FOODPANDA
    - directory
    - user: root
    - group: helpdesk
    - file_mode: 771
    - makedirs: True

