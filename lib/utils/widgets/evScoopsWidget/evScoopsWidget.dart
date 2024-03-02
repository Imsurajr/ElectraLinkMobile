import 'package:electra_link/utils/constants.dart';
import 'package:flutter/material.dart';

Widget EVScoops(BuildContext context, String title, String desc, String imgUrl) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      height: AppConstants.screenHeight(context) * 0.28,
      width: AppConstants.screenWidth(context) * 0.37,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: AppConstants.screenHeight(context) * 0.101,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      imgUrl,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: "MontserratBold",
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                fontFamily: "MontserratSemiBold",
                color: Colors.grey,
                fontSize: 12,
              ),
              softWrap: true,
              maxLines: 6,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget EVScoopsList(BuildContext context){
  return Row(
    children: [
      EVScoops(
        context,
        "Launched TVS Creon Electric Scooter",
        "The Creon concept was a properly sporty electric scooter; not only in the way it looked but also in terms of the kit it packed",
        'https://www.uptobrain.com/wp-content/uploads/2021/07/TVS-Creon-Electric-Scooter-Price-in-India.jpg',
      ),

      EVScoops(
        context,
        "Upcoming Ather 450X",
        "If you’re looking to buy an electric scooter, the Ather 450X from Ather is one of the options. It is sold in 2 variants. Powering the 450X is a 6.4 kW electric motor. The battery capacity of the Ather 450X 3.7 kWh Gen 3 is 3.7 Kwh.The weight of the Ather",
        'https://imgs.search.brave.com/1dzIkViOsaCkcib4PvGcU7PYAqn7b234aXkd5eNiBI8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9iZC5n/YWFkaWNkbi5jb20v/cHJvY2Vzc2VkaW1h/Z2VzL2F0aGVyLWVu/ZXJneS80NTB4L3Nv/dXJjZS80NTB4NjUw/YTg5MTQ2Y2EwZC5q/cGc',
      ),


      EVScoops(
        context,
        "Launched Audi A6 e-tron",
        "The Audi A6 e-tron is a concept for now, but Audi says it's super close to what the production car will look like. It's based on the scalable Premium Platform Electric (PPE) architecture that can be lengthened, lifted, and widened for a variety of different EV models",
        'https://imgs.search.brave.com/FN8ef0FHz61_gXSyZRYkG8f9BDT8kSTsVc6Ror3a9CA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90b3Bl/bGVjdHJpY3N1di5j/b20vd3AtY29udGVu/dC91cGxvYWRzLzIw/MjIvMDUvQXVkaS1B/Ni1lLXRyb24tY29u/Y2VwdC1mcm9udC10/aHJlZS1xdWFydGVy/LWxpdmUtaW1hZ2Ut/MTAyNHg2ODIuanBn',
      ),
      EVScoops(
        context,
        "Upcoming Hero Electric Optima",
        "If you’re looking to buy an electric scooter, the Hero Electric Optima from Hero Electric is one of the options. It is sold in 2 variants. Powering the Optima is a 1.2 kW electric motor. The weight of the Hero Electric Optima is 102 kg. The Optima comes with a Drum brake up front and Drum brake at the rear. You can buy the Hero Electric Optima in 2 colours - maroon, Blue.",
        'https://imgs.search.brave.com/ZqrM_mjphT-kim2fNj3W57i29yKquMzz0gx0Q8R-1nk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWdk/LmFlcGxjZG4uY29t/LzEwNTZ4NTk0L24v/YncvbW9kZWxzL2Nv/bG9ycy9oZXJvLWVs/ZWN0cmljLXNlbGVj/dC1tb2RlbC1tYXJv/b24tMTY4NTM1NDE3/ODcxNS5wbmc_cT04/MA',
      ),

      EVScoops(
        context,
        "Upcoming Ola S1 Pro",
        "If you’re looking to buy an electric scooter, the Ola S1 Pro from Ola Electric is one of the options. It is sold in 1 variant. Powering the S1 Pro is a 11 kW electric motor. The battery capacity of the Ola S1 Pro Gen 2 is 4 Kwh.The weight of the Ola S1",
        'https://imgs.search.brave.com/MmZaefBb6kNZdUBbQQGrXs-NlDeNRMxf7y6koQCaerk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG5p/LmF1dG9jYXJpbmRp/YS5jb20vVXRpbHMv/SW1hZ2VSZXNpemVy/LmFzaHg_bj1odHRw/czovL2Ntcy5oYXlt/YXJrZXRpbmRpYS5u/ZXQvbW9kZWwvdXBs/b2Fkcy9tb2RlbGlt/YWdlcy9PbGEtRWxl/Y3RyaWMtUzEtUHJv/LTE4MDgyMDIzMTcz/OS5qcGcmdz03MzAm/aD00ODQmcT03NSZj/PTE',
      ),
    ],
  );
}
