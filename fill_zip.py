import json, csv
try:
    from urllib.request import urlopen
except:
    from urllib2 import urlopen

api_key = "rsuJVkDL6Aldo6Cpp8fSzY5L6s7Q3DRA8Q7DzhfABjejNJK1G4c5xoVGuoILla9R"
request_url = "http://www.zipcodeapi.com/rest/{key}/info.json/{zip}/degrees"

with open('data/orders.csv','r') as csvinput:
    with open('data/orders_with_location_details.csv', 'w') as csvoutput:
        writer = csv.writer(csvoutput, lineterminator='\n')
        reader = csv.reader(csvinput)

        all = []
        header = next(reader)
        header.append('latitude')
        header.append('longitude')
        header.append('state')
        header.append('city')
        print(header)
        all.append(header)

        for row in reader:
            url = urlopen(request_url.format(key=api_key, zip=row[3]))
            data = json.loads(url.read().decode())
            row.append(data["lat"])
            row.append(data["lng"])
            row.append(data["city"])
            row.append(data["state"])
            print(row)
            all.append(row)

        writer.writerows(all)