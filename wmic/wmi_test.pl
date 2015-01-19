import wmi_client_wrapper as wmi

wmic = wmi.WmiClientWrapper(
    username="Administrator",
    password="SECRET",
    host="192.168.x.x",
)

output = wmic.query("SELECT * FROM Win32_Processor")
print output












