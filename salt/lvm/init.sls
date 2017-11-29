disk1:
  lvm:
    - pv_present
    - name: /dev/sdb

disk2: 
  lvm:
    - pv_present
    - name: /dev/sdc

volume_group:
  lvm:
    - vg_present
    - name: vg01
    - devices: /dev/sdb,/dev/sdc 
    - require:
      - lvm: /dev/sdb
      - lvm: /dev/sdc
 
logical_volume_one:
  lvm:
    - lv_present
    - name: takeouts
    - vgname: vg01
    - extents: '100%FREE'
    - pv: /dev/sdb

logical_volume_two:
  lvm:
    - lv_present
    - name: takeouts2
    - vgname: vg01
    - extents: '100%FREE'
    - pv: /dev/sdc

format_volume_one:
  blockdev.formatted:
    - name: /dev/vg01/takeouts
    - fs_type: 'ext4'

format_volume_two:
  blockdev.formatted:
    - name: /dev/vg01/takeouts2
    - fs_type: 'ext4'

mount_volume_one:
  mount.mounted:
    - name: /mnt/takeouts
    - device: /dev/vg01/takeouts
    - fstype: ext4
    - persist: True

mount_volume_two:
  mount.mounted:
    - name: /mnt/takeouts2
    - device: /dev/vg01/takeouts2
    - fstype: ext4
    - persist: True
