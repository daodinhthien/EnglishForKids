//
//  LessonData.swift
//  EnglishForKids
//
//  Created by ThienDD9 on 17/6/26.
//

import Foundation

struct LessonData {
    static let topics: [Topic] = [

        Topic(
            id: "animals",
            name: "Animals",
            nameVi: "Động vật",
            emoji: "🐾",
            color: "#96CEB4",
            words: [

                Word(
                    english: "Dog",
                    vietnamese: "Con chó",
                    emoji: "🐶",
                    example: "I have a dog.",
                    exampleVietnamese: "Tôi có một con chó."
                ),

                Word(
                    english: "Cat",
                    vietnamese: "Con mèo",
                    emoji: "🐱",
                    example: "The cat is sleeping.",
                    exampleVietnamese: "Con mèo đang ngủ."
                ),

                Word(
                    english: "Bird",
                    vietnamese: "Con chim",
                    emoji: "🐦",
                    example: "The bird can fly.",
                    exampleVietnamese: "Con chim có thể bay."
                ),

                Word(
                    english: "Fish",
                    vietnamese: "Con cá",
                    emoji: "🐟",
                    example: "I can see a fish.",
                    exampleVietnamese: "Tôi có thể nhìn thấy một con cá."
                ),

                Word(
                    english: "Rabbit",
                    vietnamese: "Con thỏ",
                    emoji: "🐰",
                    example: "The rabbit is white.",
                    exampleVietnamese: "Con thỏ màu trắng."
                ),

                Word(
                    english: "Tiger",
                    vietnamese: "Con hổ",
                    emoji: "🐯",
                    example: "The tiger is strong.",
                    exampleVietnamese: "Con hổ rất khỏe."
                ),

                Word(
                    english: "Lion",
                    vietnamese: "Sư tử",
                    emoji: "🦁",
                    example: "The lion is big.",
                    exampleVietnamese: "Con sư tử rất to."
                ),

                Word(
                    english: "Elephant",
                    vietnamese: "Con voi",
                    emoji: "🐘",
                    example: "The elephant is very big.",
                    exampleVietnamese: "Con voi rất to."
                ),

                Word(
                    english: "Monkey",
                    vietnamese: "Con khỉ",
                    emoji: "🐒",
                    example: "The monkey is funny.",
                    exampleVietnamese: "Con khỉ rất vui nhộn."
                ),

                Word(
                    english: "Cow",
                    vietnamese: "Con bò",
                    emoji: "🐮",
                    example: "The cow eats grass.",
                    exampleVietnamese: "Con bò ăn cỏ."
                ),

                Word(
                    english: "Pig",
                    vietnamese: "Con lợn",
                    emoji: "🐷",
                    example: "The pig is pink.",
                    exampleVietnamese: "Con lợn màu hồng."
                ),

                Word(
                    english: "Horse",
                    vietnamese: "Con ngựa",
                    emoji: "🐴",
                    example: "The horse can run fast.",
                    exampleVietnamese: "Con ngựa có thể chạy nhanh."
                ),

                Word(
                    english: "Chicken",
                    vietnamese: "Con gà",
                    emoji: "🐔",
                    example: "The chicken lays eggs.",
                    exampleVietnamese: "Con gà đẻ trứng."
                ),

                Word(
                    english: "Duck",
                    vietnamese: "Con vịt",
                    emoji: "🦆",
                    example: "The duck can swim.",
                    exampleVietnamese: "Con vịt có thể bơi."
                ),

                Word(
                    english: "Goat",
                    vietnamese: "Con dê",
                    emoji: "🐐",
                    example: "The goat eats leaves.",
                    exampleVietnamese: "Con dê ăn lá cây."
                ),

                Word(
                    english: "Sheep",
                    vietnamese: "Con cừu",
                    emoji: "🐑",
                    example: "The sheep has white wool.",
                    exampleVietnamese: "Con cừu có bộ lông trắng."
                ),

                Word(
                    english: "Bear",
                    vietnamese: "Con gấu",
                    emoji: "🐻",
                    example: "The bear is strong.",
                    exampleVietnamese: "Con gấu rất khỏe."
                ),

                Word(
                    english: "Fox",
                    vietnamese: "Con cáo",
                    emoji: "🦊",
                    example: "The fox is clever.",
                    exampleVietnamese: "Con cáo rất thông minh."
                ),

                Word(
                    english: "Wolf",
                    vietnamese: "Con sói",
                    emoji: "🐺",
                    example: "The wolf lives in the forest.",
                    exampleVietnamese: "Con sói sống trong rừng."
                ),

                Word(
                    english: "Deer",
                    vietnamese: "Con hươu",
                    emoji: "🦌",
                    example: "The deer can jump high.",
                    exampleVietnamese: "Con hươu có thể nhảy cao."
                ),

                Word(
                    english: "Zebra",
                    vietnamese: "Ngựa vằn",
                    emoji: "🦓",
                    example: "The zebra has black and white stripes.",
                    exampleVietnamese: "Ngựa vằn có các sọc đen trắng."
                ),

                Word(
                    english: "Giraffe",
                    vietnamese: "Hươu cao cổ",
                    emoji: "🦒",
                    example: "The giraffe has a long neck.",
                    exampleVietnamese: "Hươu cao cổ có chiếc cổ dài."
                ),

                Word(
                    english: "Panda",
                    vietnamese: "Gấu trúc",
                    emoji: "🐼",
                    example: "The panda eats bamboo.",
                    exampleVietnamese: "Gấu trúc ăn tre."
                ),

                Word(
                    english: "Koala",
                    vietnamese: "Gấu túi",
                    emoji: "🐨",
                    example: "The koala lives in Australia.",
                    exampleVietnamese: "Gấu túi sống ở Úc."
                ),

                Word(
                    english: "Kangaroo",
                    vietnamese: "Chuột túi",
                    emoji: "🦘",
                    example: "The kangaroo can jump far.",
                    exampleVietnamese: "Chuột túi có thể nhảy rất xa."
                ),

                Word(
                    english: "Hippo",
                    vietnamese: "Hà mã",
                    emoji: "🦛",
                    example: "The hippo lives in rivers.",
                    exampleVietnamese: "Hà mã sống ở sông."
                ),

                Word(
                    english: "Rhino",
                    vietnamese: "Tê giác",
                    emoji: "🦏",
                    example: "The rhino has a horn.",
                    exampleVietnamese: "Tê giác có một chiếc sừng."
                ),

                Word(
                    english: "Snake",
                    vietnamese: "Con rắn",
                    emoji: "🐍",
                    example: "The snake is long.",
                    exampleVietnamese: "Con rắn rất dài."
                ),

                Word(
                    english: "Turtle",
                    vietnamese: "Con rùa",
                    emoji: "🐢",
                    example: "The turtle walks slowly.",
                    exampleVietnamese: "Con rùa đi rất chậm."
                ),

                Word(
                    english: "Frog",
                    vietnamese: "Con ếch",
                    emoji: "🐸",
                    example: "The frog can jump.",
                    exampleVietnamese: "Con ếch có thể nhảy."
                )
            ]
        ),
        Topic(
            id: "family",
            name: "Family",
            nameVi: "Gia đình",
            emoji: "👨‍👩‍👧‍👦",
            color: "#45B7D1",
            words: [

                Word(english: "Father", vietnamese: "Bố", emoji: "👨", example: "My father is tall.", exampleVietnamese: "Bố tôi rất cao."),
                Word(english: "Mother", vietnamese: "Mẹ", emoji: "👩", example: "My mother is kind.", exampleVietnamese: "Mẹ tôi rất tốt bụng."),
                Word(english: "Brother", vietnamese: "Anh/Em trai", emoji: "👦", example: "My brother likes football.", exampleVietnamese: "Anh trai tôi thích bóng đá."),
                Word(english: "Sister", vietnamese: "Chị/Em gái", emoji: "👧", example: "My sister is cute.", exampleVietnamese: "Em gái tôi rất dễ thương."),
                Word(english: "Grandfather", vietnamese: "Ông", emoji: "👴", example: "My grandfather is old.", exampleVietnamese: "Ông tôi đã lớn tuổi."),
                Word(english: "Grandmother", vietnamese: "Bà", emoji: "👵", example: "My grandmother cooks well.", exampleVietnamese: "Bà tôi nấu ăn rất ngon."),
                Word(english: "Baby", vietnamese: "Em bé", emoji: "👶", example: "The baby is sleeping.", exampleVietnamese: "Em bé đang ngủ."),
                Word(english: "Uncle", vietnamese: "Chú/Bác", emoji: "👨", example: "My uncle drives a car.", exampleVietnamese: "Chú tôi lái ô tô."),
                Word(english: "Aunt", vietnamese: "Cô/Dì", emoji: "👩", example: "My aunt is a teacher.", exampleVietnamese: "Cô tôi là giáo viên."),
                Word(english: "Cousin", vietnamese: "Anh chị em họ", emoji: "🧑", example: "My cousin lives in Hanoi.", exampleVietnamese: "Anh họ tôi sống ở Hà Nội."),
                Word(english: "Son", vietnamese: "Con trai", emoji: "👦", example: "They have a son.", exampleVietnamese: "Họ có một con trai."),
                Word(english: "Daughter", vietnamese: "Con gái", emoji: "👧", example: "She has a daughter.", exampleVietnamese: "Cô ấy có một con gái."),
                Word(english: "Parents", vietnamese: "Bố mẹ", emoji: "👨‍👩‍👧", example: "My parents are busy.", exampleVietnamese: "Bố mẹ tôi rất bận."),
                Word(english: "Family", vietnamese: "Gia đình", emoji: "🏡", example: "I love my family.", exampleVietnamese: "Tôi yêu gia đình của mình."),
                Word(english: "Friend", vietnamese: "Bạn bè", emoji: "🤝", example: "He is my friend.", exampleVietnamese: "Cậu ấy là bạn tôi."),
                Word(english: "Neighbor", vietnamese: "Hàng xóm", emoji: "🏠", example: "My neighbor is friendly.", exampleVietnamese: "Hàng xóm của tôi rất thân thiện."),
                Word(english: "Husband", vietnamese: "Chồng", emoji: "👨", example: "Her husband works hard.", exampleVietnamese: "Chồng cô ấy làm việc chăm chỉ."),
                Word(english: "Wife", vietnamese: "Vợ", emoji: "👩", example: "His wife is a doctor.", exampleVietnamese: "Vợ anh ấy là bác sĩ."),
                Word(english: "Twin", vietnamese: "Sinh đôi", emoji: "👭", example: "They are twins.", exampleVietnamese: "Họ là cặp sinh đôi."),
                Word(english: "Relative", vietnamese: "Họ hàng", emoji: "👨‍👩‍👧‍👦", example: "Many relatives visited us.", exampleVietnamese: "Nhiều họ hàng đã đến thăm chúng tôi."),
                Word(english: "Grandson", vietnamese: "Cháu trai", emoji: "👦", example: "He is my grandson.", exampleVietnamese: "Đó là cháu trai của tôi."),
                Word(english: "Granddaughter", vietnamese: "Cháu gái", emoji: "👧", example: "She is my granddaughter.", exampleVietnamese: "Đó là cháu gái của tôi."),
                Word(english: "Child", vietnamese: "Đứa trẻ", emoji: "🧒", example: "The child is happy.", exampleVietnamese: "Đứa trẻ rất vui."),
                Word(english: "Adult", vietnamese: "Người lớn", emoji: "🧑", example: "Adults work every day.", exampleVietnamese: "Người lớn làm việc mỗi ngày."),
                Word(english: "Brother-in-law", vietnamese: "Anh rể/Em rể", emoji: "👨", example: "My brother-in-law is funny.", exampleVietnamese: "Anh rể tôi rất vui tính."),
                Word(english: "Sister-in-law", vietnamese: "Chị dâu/Em dâu", emoji: "👩", example: "My sister-in-law is nice.", exampleVietnamese: "Chị dâu tôi rất tốt."),
                Word(english: "Nephew", vietnamese: "Cháu trai", emoji: "👦", example: "My nephew is five.", exampleVietnamese: "Cháu trai tôi năm tuổi."),
                Word(english: "Niece", vietnamese: "Cháu gái", emoji: "👧", example: "My niece likes dolls.", exampleVietnamese: "Cháu gái tôi thích búp bê."),
                Word(english: "Pet", vietnamese: "Thú cưng", emoji: "🐶", example: "Our pet is a dog.", exampleVietnamese: "Thú cưng của chúng tôi là một con chó."),
                Word(english: "Home", vietnamese: "Nhà", emoji: "🏠", example: "I go home after school.", exampleVietnamese: "Tôi về nhà sau giờ học.")
            ]
        ),
        Topic(
            id: "colors",
            name: "Colors",
            nameVi: "Màu sắc",
            emoji: "🎨",
            color: "#FFEAA7",
            words: [

                Word(english: "Red", vietnamese: "Đỏ", emoji: "🔴", example: "The apple is red.", exampleVietnamese: "Quả táo màu đỏ."),
                Word(english: "Blue", vietnamese: "Xanh dương", emoji: "🔵", example: "The sky is blue.", exampleVietnamese: "Bầu trời màu xanh."),
                Word(english: "Green", vietnamese: "Xanh lá", emoji: "🟢", example: "The tree is green.", exampleVietnamese: "Cây có màu xanh lá."),
                Word(english: "Yellow", vietnamese: "Vàng", emoji: "🟡", example: "The sun is yellow.", exampleVietnamese: "Mặt trời màu vàng."),
                Word(english: "Orange", vietnamese: "Cam", emoji: "🟠", example: "The orange is orange.", exampleVietnamese: "Quả cam màu cam."),
                Word(english: "Pink", vietnamese: "Hồng", emoji: "🩷", example: "The flower is pink.", exampleVietnamese: "Bông hoa màu hồng."),
                Word(english: "Purple", vietnamese: "Tím", emoji: "🟣", example: "I like purple.", exampleVietnamese: "Tôi thích màu tím."),
                Word(english: "White", vietnamese: "Trắng", emoji: "⚪", example: "Snow is white.", exampleVietnamese: "Tuyết màu trắng."),
                Word(english: "Black", vietnamese: "Đen", emoji: "⚫", example: "The cat is black.", exampleVietnamese: "Con mèo màu đen."),
                Word(english: "Brown", vietnamese: "Nâu", emoji: "🟤", example: "The bear is brown.", exampleVietnamese: "Con gấu màu nâu."),
                Word(english: "Gray", vietnamese: "Xám", emoji: "⚪", example: "The elephant is gray.", exampleVietnamese: "Con voi màu xám."),
                Word(english: "Gold", vietnamese: "Vàng kim", emoji: "🥇", example: "The ring is gold.", exampleVietnamese: "Chiếc nhẫn màu vàng kim."),
                Word(english: "Silver", vietnamese: "Bạc", emoji: "🥈", example: "The spoon is silver.", exampleVietnamese: "Cái thìa màu bạc."),
                Word(english: "Dark", vietnamese: "Tối màu", emoji: "🌑", example: "The room is dark.", exampleVietnamese: "Căn phòng tối."),
                Word(english: "Light", vietnamese: "Sáng màu", emoji: "💡", example: "The wall is light blue.", exampleVietnamese: "Bức tường màu xanh nhạt."),
                Word(english: "Violet", vietnamese: "Tím violet", emoji: "🟣", example: "The dress is violet.", exampleVietnamese: "Chiếc váy màu tím."),
                Word(english: "Indigo", vietnamese: "Chàm", emoji: "🔵", example: "The paint is indigo.", exampleVietnamese: "Sơn màu chàm."),
                Word(english: "Beige", vietnamese: "Be", emoji: "🟫", example: "The sofa is beige.", exampleVietnamese: "Ghế sofa màu be."),
                Word(english: "Navy", vietnamese: "Xanh navy", emoji: "🔵", example: "His shirt is navy.", exampleVietnamese: "Áo anh ấy màu xanh navy."),
                Word(english: "Olive", vietnamese: "Xanh ô liu", emoji: "🫒", example: "The bag is olive.", exampleVietnamese: "Chiếc túi màu xanh ô liu."),
                Word(english: "Cyan", vietnamese: "Xanh lơ", emoji: "🔷", example: "The water is cyan.", exampleVietnamese: "Nước màu xanh lơ."),
                Word(english: "Magenta", vietnamese: "Đỏ tím", emoji: "🩷", example: "The flower is magenta.", exampleVietnamese: "Bông hoa màu đỏ tím."),
                Word(english: "Scarlet", vietnamese: "Đỏ tươi", emoji: "🔴", example: "The flag is scarlet.", exampleVietnamese: "Lá cờ màu đỏ tươi."),
                Word(english: "Crimson", vietnamese: "Đỏ thẫm", emoji: "🔴", example: "The rose is crimson.", exampleVietnamese: "Hoa hồng màu đỏ thẫm."),
                Word(english: "Amber", vietnamese: "Hổ phách", emoji: "🟠", example: "The light is amber.", exampleVietnamese: "Ánh đèn màu hổ phách."),
                Word(english: "Mint", vietnamese: "Xanh bạc hà", emoji: "🌿", example: "The wall is mint.", exampleVietnamese: "Bức tường màu xanh bạc hà."),
                Word(english: "Lavender", vietnamese: "Tím oải hương", emoji: "💜", example: "The room is lavender.", exampleVietnamese: "Căn phòng màu tím oải hương."),
                Word(english: "Coral", vietnamese: "San hô", emoji: "🪸", example: "The dress is coral.", exampleVietnamese: "Chiếc váy màu san hô."),
                Word(english: "Cream", vietnamese: "Kem", emoji: "🤍", example: "The chair is cream.", exampleVietnamese: "Chiếc ghế màu kem."),
                Word(english: "Turquoise", vietnamese: "Xanh ngọc", emoji: "💎", example: "The sea is turquoise.", exampleVietnamese: "Biển có màu xanh ngọc.")
            ]
        ),
        Topic(
            id: "numbers",
            name: "Numbers",
            nameVi: "Số đếm",
            emoji: "🔢",
            color: "#DDA0DD",
            words: [

                Word(english: "One", vietnamese: "Một", emoji: "1️⃣", example: "I have one cat.", exampleVietnamese: "Tôi có một con mèo."),
                Word(english: "Two", vietnamese: "Hai", emoji: "2️⃣", example: "I have two dogs.", exampleVietnamese: "Tôi có hai con chó."),
                Word(english: "Three", vietnamese: "Ba", emoji: "3️⃣", example: "I see three birds.", exampleVietnamese: "Tôi thấy ba con chim."),
                Word(english: "Four", vietnamese: "Bốn", emoji: "4️⃣", example: "I have four books.", exampleVietnamese: "Tôi có bốn quyển sách."),
                Word(english: "Five", vietnamese: "Năm", emoji: "5️⃣", example: "I have five pens.", exampleVietnamese: "Tôi có năm cây bút."),
                Word(english: "Six", vietnamese: "Sáu", emoji: "6️⃣", example: "There are six fish.", exampleVietnamese: "Có sáu con cá."),
                Word(english: "Seven", vietnamese: "Bảy", emoji: "7️⃣", example: "There are seven days.", exampleVietnamese: "Có bảy ngày."),
                Word(english: "Eight", vietnamese: "Tám", emoji: "8️⃣", example: "I have eight crayons.", exampleVietnamese: "Tôi có tám bút màu."),
                Word(english: "Nine", vietnamese: "Chín", emoji: "9️⃣", example: "There are nine cats.", exampleVietnamese: "Có chín con mèo."),
                Word(english: "Ten", vietnamese: "Mười", emoji: "🔟", example: "I count to ten.", exampleVietnamese: "Tôi đếm đến mười."),

                Word(english: "Eleven", vietnamese: "Mười một", emoji: "1️⃣1️⃣", example: "I am eleven years old.", exampleVietnamese: "Tôi mười một tuổi."),
                Word(english: "Twelve", vietnamese: "Mười hai", emoji: "1️⃣2️⃣", example: "There are twelve students.", exampleVietnamese: "Có mười hai học sinh."),
                Word(english: "Thirteen", vietnamese: "Mười ba", emoji: "1️⃣3️⃣", example: "I have thirteen stickers.", exampleVietnamese: "Tôi có mười ba nhãn dán."),
                Word(english: "Fourteen", vietnamese: "Mười bốn", emoji: "1️⃣4️⃣", example: "There are fourteen chairs.", exampleVietnamese: "Có mười bốn chiếc ghế."),
                Word(english: "Fifteen", vietnamese: "Mười lăm", emoji: "1️⃣5️⃣", example: "I have fifteen pencils.", exampleVietnamese: "Tôi có mười lăm bút chì."),
                Word(english: "Sixteen", vietnamese: "Mười sáu", emoji: "1️⃣6️⃣", example: "There are sixteen apples.", exampleVietnamese: "Có mười sáu quả táo."),
                Word(english: "Seventeen", vietnamese: "Mười bảy", emoji: "1️⃣7️⃣", example: "I see seventeen birds.", exampleVietnamese: "Tôi thấy mười bảy con chim."),
                Word(english: "Eighteen", vietnamese: "Mười tám", emoji: "1️⃣8️⃣", example: "There are eighteen books.", exampleVietnamese: "Có mười tám quyển sách."),
                Word(english: "Nineteen", vietnamese: "Mười chín", emoji: "1️⃣9️⃣", example: "I have nineteen toys.", exampleVietnamese: "Tôi có mười chín món đồ chơi."),
                Word(english: "Twenty", vietnamese: "Hai mươi", emoji: "2️⃣0️⃣", example: "There are twenty students.", exampleVietnamese: "Có hai mươi học sinh."),

                Word(english: "Thirty", vietnamese: "Ba mươi", emoji: "3️⃣0️⃣", example: "I have thirty cards.", exampleVietnamese: "Tôi có ba mươi tấm thẻ."),
                Word(english: "Forty", vietnamese: "Bốn mươi", emoji: "4️⃣0️⃣", example: "There are forty books.", exampleVietnamese: "Có bốn mươi quyển sách."),
                Word(english: "Fifty", vietnamese: "Năm mươi", emoji: "5️⃣0️⃣", example: "I have fifty marbles.", exampleVietnamese: "Tôi có năm mươi viên bi."),
                Word(english: "Sixty", vietnamese: "Sáu mươi", emoji: "6️⃣0️⃣", example: "There are sixty trees.", exampleVietnamese: "Có sáu mươi cái cây."),
                Word(english: "Seventy", vietnamese: "Bảy mươi", emoji: "7️⃣0️⃣", example: "I see seventy birds.", exampleVietnamese: "Tôi thấy bảy mươi con chim."),
                Word(english: "Eighty", vietnamese: "Tám mươi", emoji: "8️⃣0️⃣", example: "There are eighty flowers.", exampleVietnamese: "Có tám mươi bông hoa."),
                Word(english: "Ninety", vietnamese: "Chín mươi", emoji: "9️⃣0️⃣", example: "I have ninety stickers.", exampleVietnamese: "Tôi có chín mươi nhãn dán."),
                Word(english: "One hundred", vietnamese: "Một trăm", emoji: "💯", example: "There are one hundred stars.", exampleVietnamese: "Có một trăm ngôi sao."),
                Word(english: "Number", vietnamese: "Con số", emoji: "🔢", example: "What number is it?", exampleVietnamese: "Đó là số mấy?"),
                Word(english: "Count", vietnamese: "Đếm", emoji: "🧮", example: "Let's count together.", exampleVietnamese: "Hãy cùng nhau đếm.")
            ]
        ),
        Topic(
            id: "body",
            name: "Body",
            nameVi: "Cơ thể",
            emoji: "🧍",
            color: "#87CEEB",
            words: [

                Word(english: "Head", vietnamese: "Đầu", emoji: "🗣️", example: "I have a head.", exampleVietnamese: "Tôi có một cái đầu."),
                Word(english: "Hair", vietnamese: "Tóc", emoji: "💇", example: "My hair is black.", exampleVietnamese: "Tóc của tôi màu đen."),
                Word(english: "Face", vietnamese: "Khuôn mặt", emoji: "😊", example: "She has a pretty face.", exampleVietnamese: "Cô ấy có khuôn mặt xinh đẹp."),
                Word(english: "Eye", vietnamese: "Mắt", emoji: "👁️", example: "I have two eyes.", exampleVietnamese: "Tôi có hai mắt."),
                Word(english: "Ear", vietnamese: "Tai", emoji: "👂", example: "I have two ears.", exampleVietnamese: "Tôi có hai tai."),
                Word(english: "Nose", vietnamese: "Mũi", emoji: "👃", example: "My nose is small.", exampleVietnamese: "Mũi tôi nhỏ."),
                Word(english: "Mouth", vietnamese: "Miệng", emoji: "👄", example: "Open your mouth.", exampleVietnamese: "Hãy mở miệng."),
                Word(english: "Lip", vietnamese: "Môi", emoji: "💋", example: "Her lips are pink.", exampleVietnamese: "Môi cô ấy màu hồng."),
                Word(english: "Tooth", vietnamese: "Răng", emoji: "🦷", example: "I brush my teeth.", exampleVietnamese: "Tôi đánh răng."),
                Word(english: "Tongue", vietnamese: "Lưỡi", emoji: "👅", example: "The tongue helps us taste.", exampleVietnamese: "Lưỡi giúp chúng ta nếm vị."),

                Word(english: "Neck", vietnamese: "Cổ", emoji: "🦒", example: "My neck is long.", exampleVietnamese: "Cổ tôi dài."),
                Word(english: "Shoulder", vietnamese: "Vai", emoji: "💪", example: "My shoulder hurts.", exampleVietnamese: "Vai tôi bị đau."),
                Word(english: "Arm", vietnamese: "Cánh tay", emoji: "💪", example: "Raise your arm.", exampleVietnamese: "Hãy giơ cánh tay lên."),
                Word(english: "Elbow", vietnamese: "Khuỷu tay", emoji: "💪", example: "My elbow is bent.", exampleVietnamese: "Khuỷu tay tôi đang gập."),
                Word(english: "Hand", vietnamese: "Bàn tay", emoji: "✋", example: "Wash your hands.", exampleVietnamese: "Hãy rửa tay."),
                Word(english: "Finger", vietnamese: "Ngón tay", emoji: "☝️", example: "I have ten fingers.", exampleVietnamese: "Tôi có mười ngón tay."),
                Word(english: "Thumb", vietnamese: "Ngón cái", emoji: "👍", example: "Give me a thumbs up.", exampleVietnamese: "Hãy giơ ngón cái lên."),
                Word(english: "Chest", vietnamese: "Ngực", emoji: "🫁", example: "Take a deep breath.", exampleVietnamese: "Hãy hít thở sâu."),
                Word(english: "Back", vietnamese: "Lưng", emoji: "🧍", example: "My back is strong.", exampleVietnamese: "Lưng tôi khỏe."),
                Word(english: "Stomach", vietnamese: "Bụng", emoji: "🍽️", example: "My stomach is full.", exampleVietnamese: "Bụng tôi no rồi."),

                Word(english: "Waist", vietnamese: "Eo", emoji: "🧍", example: "She has a slim waist.", exampleVietnamese: "Cô ấy có vòng eo thon."),
                Word(english: "Hip", vietnamese: "Hông", emoji: "🧍", example: "Move your hips.", exampleVietnamese: "Hãy di chuyển hông."),
                Word(english: "Leg", vietnamese: "Chân", emoji: "🦵", example: "My legs are strong.", exampleVietnamese: "Chân tôi khỏe."),
                Word(english: "Knee", vietnamese: "Đầu gối", emoji: "🦵", example: "My knee hurts.", exampleVietnamese: "Đầu gối tôi bị đau."),
                Word(english: "Foot", vietnamese: "Bàn chân", emoji: "🦶", example: "I have two feet.", exampleVietnamese: "Tôi có hai bàn chân."),
                Word(english: "Toe", vietnamese: "Ngón chân", emoji: "🦶", example: "I have ten toes.", exampleVietnamese: "Tôi có mười ngón chân."),
                Word(english: "Skin", vietnamese: "Da", emoji: "🤚", example: "My skin is soft.", exampleVietnamese: "Da tôi mềm."),
                Word(english: "Bone", vietnamese: "Xương", emoji: "🦴", example: "Bones are important.", exampleVietnamese: "Xương rất quan trọng."),
                Word(english: "Heart", vietnamese: "Tim", emoji: "❤️", example: "My heart beats fast.", exampleVietnamese: "Tim tôi đập nhanh."),
                Word(english: "Body", vietnamese: "Cơ thể", emoji: "🧍", example: "Exercise is good for your body.", exampleVietnamese: "Tập thể dục tốt cho cơ thể.")
            ]
        ),
        Topic(
            id: "food",
            name: "Food",
            nameVi: "Đồ ăn",
            emoji: "🍎",
            color: "#F0E68C",
            words: [

                Word(english: "Apple", vietnamese: "Táo", emoji: "🍎", example: "I eat an apple.", exampleVietnamese: "Tôi ăn một quả táo."),
                Word(english: "Banana", vietnamese: "Chuối", emoji: "🍌", example: "The banana is yellow.", exampleVietnamese: "Quả chuối màu vàng."),
                Word(english: "Orange", vietnamese: "Cam", emoji: "🍊", example: "I like oranges.", exampleVietnamese: "Tôi thích cam."),
                Word(english: "Grape", vietnamese: "Nho", emoji: "🍇", example: "These grapes are sweet.", exampleVietnamese: "Những quả nho này rất ngọt."),
                Word(english: "Watermelon", vietnamese: "Dưa hấu", emoji: "🍉", example: "The watermelon is big.", exampleVietnamese: "Quả dưa hấu rất to."),
                Word(english: "Strawberry", vietnamese: "Dâu tây", emoji: "🍓", example: "I like strawberries.", exampleVietnamese: "Tôi thích dâu tây."),
                Word(english: "Pineapple", vietnamese: "Dứa", emoji: "🍍", example: "The pineapple is juicy.", exampleVietnamese: "Quả dứa mọng nước."),
                Word(english: "Mango", vietnamese: "Xoài", emoji: "🥭", example: "Mangoes are delicious.", exampleVietnamese: "Xoài rất ngon."),
                Word(english: "Rice", vietnamese: "Cơm", emoji: "🍚", example: "I eat rice every day.", exampleVietnamese: "Tôi ăn cơm mỗi ngày."),
                Word(english: "Bread", vietnamese: "Bánh mì", emoji: "🍞", example: "I eat bread for breakfast.", exampleVietnamese: "Tôi ăn bánh mì vào bữa sáng."),

                Word(english: "Cake", vietnamese: "Bánh kem", emoji: "🎂", example: "I like cake.", exampleVietnamese: "Tôi thích bánh kem."),
                Word(english: "Cookie", vietnamese: "Bánh quy", emoji: "🍪", example: "The cookie is sweet.", exampleVietnamese: "Bánh quy rất ngọt."),
                Word(english: "Candy", vietnamese: "Kẹo", emoji: "🍬", example: "The child likes candy.", exampleVietnamese: "Đứa trẻ thích kẹo."),
                Word(english: "Chocolate", vietnamese: "Sô cô la", emoji: "🍫", example: "Chocolate is delicious.", exampleVietnamese: "Sô cô la rất ngon."),
                Word(english: "Milk", vietnamese: "Sữa", emoji: "🥛", example: "I drink milk every morning.", exampleVietnamese: "Tôi uống sữa mỗi sáng."),
                Word(english: "Water", vietnamese: "Nước", emoji: "💧", example: "Drink more water.", exampleVietnamese: "Hãy uống nhiều nước hơn."),
                Word(english: "Juice", vietnamese: "Nước ép", emoji: "🧃", example: "I like orange juice.", exampleVietnamese: "Tôi thích nước cam."),
                Word(english: "Tea", vietnamese: "Trà", emoji: "🍵", example: "My grandfather drinks tea.", exampleVietnamese: "Ông tôi uống trà."),
                Word(english: "Coffee", vietnamese: "Cà phê", emoji: "☕", example: "My father drinks coffee.", exampleVietnamese: "Bố tôi uống cà phê."),
                Word(english: "Egg", vietnamese: "Trứng", emoji: "🥚", example: "I eat an egg.", exampleVietnamese: "Tôi ăn một quả trứng."),

                Word(english: "Chicken", vietnamese: "Thịt gà", emoji: "🍗", example: "Chicken is tasty.", exampleVietnamese: "Thịt gà rất ngon."),
                Word(english: "Beef", vietnamese: "Thịt bò", emoji: "🥩", example: "I like beef.", exampleVietnamese: "Tôi thích thịt bò."),
                Word(english: "Fish", vietnamese: "Cá", emoji: "🐟", example: "Fish is healthy.", exampleVietnamese: "Cá tốt cho sức khỏe."),
                Word(english: "Soup", vietnamese: "Súp", emoji: "🍲", example: "The soup is hot.", exampleVietnamese: "Bát súp còn nóng."),
                Word(english: "Noodles", vietnamese: "Mì", emoji: "🍜", example: "I like noodles.", exampleVietnamese: "Tôi thích mì."),
                Word(english: "Pizza", vietnamese: "Pizza", emoji: "🍕", example: "We eat pizza on Sunday.", exampleVietnamese: "Chúng tôi ăn pizza vào Chủ nhật."),
                Word(english: "Hamburger", vietnamese: "Bánh hamburger", emoji: "🍔", example: "The hamburger is big.", exampleVietnamese: "Chiếc hamburger rất lớn."),
                Word(english: "Ice cream", vietnamese: "Kem", emoji: "🍦", example: "I love ice cream.", exampleVietnamese: "Tôi rất thích kem."),
                Word(english: "Breakfast", vietnamese: "Bữa sáng", emoji: "🍳", example: "Breakfast is important.", exampleVietnamese: "Bữa sáng rất quan trọng."),
                Word(english: "Dinner", vietnamese: "Bữa tối", emoji: "🍽️", example: "We have dinner together.", exampleVietnamese: "Chúng tôi ăn tối cùng nhau.")
            ]
        ),
        Topic(
            id: "clothes",
            name: "Clothes",
            nameVi: "Quần áo",
            emoji: "👕",
            color: "#FFB6C1",
            words: [

                Word(english: "Shirt", vietnamese: "Áo sơ mi", emoji: "👔", example: "This shirt is new.", exampleVietnamese: "Chiếc áo sơ mi này mới."),
                Word(english: "T-shirt", vietnamese: "Áo thun", emoji: "👕", example: "I wear a T-shirt.", exampleVietnamese: "Tôi mặc áo thun."),
                Word(english: "Jacket", vietnamese: "Áo khoác", emoji: "🧥", example: "It is cold, wear a jacket.", exampleVietnamese: "Trời lạnh, hãy mặc áo khoác."),
                Word(english: "Coat", vietnamese: "Áo măng tô", emoji: "🧥", example: "Her coat is beautiful.", exampleVietnamese: "Chiếc áo khoác dài của cô ấy rất đẹp."),
                Word(english: "Sweater", vietnamese: "Áo len", emoji: "🧶", example: "My sweater is warm.", exampleVietnamese: "Áo len của tôi rất ấm."),
                Word(english: "Dress", vietnamese: "Váy", emoji: "👗", example: "She wears a dress.", exampleVietnamese: "Cô ấy mặc một chiếc váy."),
                Word(english: "Skirt", vietnamese: "Chân váy", emoji: "👗", example: "The skirt is pink.", exampleVietnamese: "Chiếc váy màu hồng."),
                Word(english: "Jeans", vietnamese: "Quần jean", emoji: "👖", example: "I wear blue jeans.", exampleVietnamese: "Tôi mặc quần jean xanh."),
                Word(english: "Shorts", vietnamese: "Quần đùi", emoji: "🩳", example: "He wears shorts.", exampleVietnamese: "Cậu ấy mặc quần đùi."),
                Word(english: "Pants", vietnamese: "Quần dài", emoji: "👖", example: "My pants are black.", exampleVietnamese: "Quần của tôi màu đen."),

                Word(english: "Sock", vietnamese: "Tất", emoji: "🧦", example: "I need clean socks.", exampleVietnamese: "Tôi cần đôi tất sạch."),
                Word(english: "Shoe", vietnamese: "Giày", emoji: "👟", example: "My shoes are new.", exampleVietnamese: "Đôi giày của tôi mới."),
                Word(english: "Boot", vietnamese: "Ủng", emoji: "🥾", example: "The boots are strong.", exampleVietnamese: "Đôi ủng rất chắc chắn."),
                Word(english: "Sandal", vietnamese: "Dép", emoji: "🩴", example: "I wear sandals in summer.", exampleVietnamese: "Tôi đi dép vào mùa hè."),
                Word(english: "Hat", vietnamese: "Mũ", emoji: "🧢", example: "The hat is red.", exampleVietnamese: "Chiếc mũ màu đỏ."),
                Word(english: "Cap", vietnamese: "Mũ lưỡi trai", emoji: "🧢", example: "He wears a cap.", exampleVietnamese: "Cậu ấy đội mũ lưỡi trai."),
                Word(english: "Scarf", vietnamese: "Khăn quàng", emoji: "🧣", example: "The scarf is warm.", exampleVietnamese: "Chiếc khăn rất ấm."),
                Word(english: "Glove", vietnamese: "Găng tay", emoji: "🧤", example: "Wear gloves in winter.", exampleVietnamese: "Hãy đeo găng tay vào mùa đông."),
                Word(english: "Belt", vietnamese: "Thắt lưng", emoji: "➖", example: "My belt is brown.", exampleVietnamese: "Thắt lưng của tôi màu nâu."),
                Word(english: "Tie", vietnamese: "Cà vạt", emoji: "👔", example: "The tie is blue.", exampleVietnamese: "Chiếc cà vạt màu xanh."),

                Word(english: "Uniform", vietnamese: "Đồng phục", emoji: "🏫", example: "Students wear uniforms.", exampleVietnamese: "Học sinh mặc đồng phục."),
                Word(english: "Pocket", vietnamese: "Túi áo/quần", emoji: "👖", example: "My phone is in my pocket.", exampleVietnamese: "Điện thoại ở trong túi quần."),
                Word(english: "Button", vietnamese: "Cúc áo", emoji: "🔘", example: "The button is missing.", exampleVietnamese: "Cúc áo bị mất."),
                Word(english: "Zipper", vietnamese: "Khóa kéo", emoji: "📎", example: "Close the zipper.", exampleVietnamese: "Hãy kéo khóa lại."),
                Word(english: "Pajamas", vietnamese: "Đồ ngủ", emoji: "🌙", example: "I wear pajamas at night.", exampleVietnamese: "Tôi mặc đồ ngủ vào ban đêm."),
                Word(english: "Raincoat", vietnamese: "Áo mưa", emoji: "🌧️", example: "Take your raincoat.", exampleVietnamese: "Hãy mang theo áo mưa."),
                Word(english: "Watch", vietnamese: "Đồng hồ đeo tay", emoji: "⌚", example: "My watch is new.", exampleVietnamese: "Đồng hồ của tôi mới."),
                Word(english: "Ring", vietnamese: "Nhẫn", emoji: "💍", example: "The ring is beautiful.", exampleVietnamese: "Chiếc nhẫn rất đẹp."),
                Word(english: "Necklace", vietnamese: "Dây chuyền", emoji: "📿", example: "She wears a necklace.", exampleVietnamese: "Cô ấy đeo dây chuyền."),
                Word(english: "Clothes", vietnamese: "Quần áo", emoji: "👕", example: "These clothes are clean.", exampleVietnamese: "Những bộ quần áo này sạch.")
            ]
        ),
        Topic(
            id: "house",
            name: "House",
            nameVi: "Ngôi nhà",
            emoji: "🏠",
            color: "#FFA07A",
            words: [

                Word(english: "House", vietnamese: "Ngôi nhà", emoji: "🏠", example: "My house is big.", exampleVietnamese: "Nhà tôi rất lớn."),
                Word(english: "Room", vietnamese: "Phòng", emoji: "🚪", example: "This room is clean.", exampleVietnamese: "Căn phòng này sạch sẽ."),
                Word(english: "Bedroom", vietnamese: "Phòng ngủ", emoji: "🛏️", example: "I sleep in my bedroom.", exampleVietnamese: "Tôi ngủ trong phòng ngủ."),
                Word(english: "Bathroom", vietnamese: "Phòng tắm", emoji: "🛁", example: "The bathroom is small.", exampleVietnamese: "Phòng tắm khá nhỏ."),
                Word(english: "Kitchen", vietnamese: "Nhà bếp", emoji: "🍳", example: "My mother is in the kitchen.", exampleVietnamese: "Mẹ tôi đang ở trong bếp."),
                Word(english: "Living room", vietnamese: "Phòng khách", emoji: "🛋️", example: "We watch TV in the living room.", exampleVietnamese: "Chúng tôi xem TV ở phòng khách."),
                Word(english: "Door", vietnamese: "Cửa", emoji: "🚪", example: "Please close the door.", exampleVietnamese: "Hãy đóng cửa lại."),
                Word(english: "Window", vietnamese: "Cửa sổ", emoji: "🪟", example: "Open the window.", exampleVietnamese: "Hãy mở cửa sổ."),
                Word(english: "Floor", vietnamese: "Sàn nhà", emoji: "⬜", example: "The floor is clean.", exampleVietnamese: "Sàn nhà rất sạch."),
                Word(english: "Wall", vietnamese: "Tường", emoji: "🧱", example: "The wall is white.", exampleVietnamese: "Bức tường màu trắng."),
                Word(english: "Roof", vietnamese: "Mái nhà", emoji: "🏠", example: "The roof is red.", exampleVietnamese: "Mái nhà màu đỏ."),
                Word(english: "Table", vietnamese: "Cái bàn", emoji: "🪑", example: "The book is on the table.", exampleVietnamese: "Quyển sách ở trên bàn."),
                Word(english: "Chair", vietnamese: "Cái ghế", emoji: "🪑", example: "Sit on the chair.", exampleVietnamese: "Hãy ngồi lên ghế."),
                Word(english: "Bed", vietnamese: "Giường", emoji: "🛏️", example: "My bed is comfortable.", exampleVietnamese: "Chiếc giường của tôi rất êm."),
                Word(english: "Sofa", vietnamese: "Ghế sofa", emoji: "🛋️", example: "The sofa is soft.", exampleVietnamese: "Ghế sofa rất mềm."),
                Word(english: "Lamp", vietnamese: "Đèn", emoji: "💡", example: "Turn on the lamp.", exampleVietnamese: "Hãy bật đèn lên."),
                Word(english: "Fan", vietnamese: "Quạt", emoji: "🪭", example: "The fan is running.", exampleVietnamese: "Quạt đang chạy."),
                Word(english: "Television", vietnamese: "Ti vi", emoji: "📺", example: "I watch television.", exampleVietnamese: "Tôi xem ti vi."),
                Word(english: "Refrigerator", vietnamese: "Tủ lạnh", emoji: "🧊", example: "The milk is in the refrigerator.", exampleVietnamese: "Sữa ở trong tủ lạnh."),
                Word(english: "Garden", vietnamese: "Khu vườn", emoji: "🌳", example: "We play in the garden.", exampleVietnamese: "Chúng tôi chơi trong vườn.")
            ]
        ),
        Topic(
            id: "weather",
            name: "Weather",
            nameVi: "Thời tiết",
            emoji: "🌦",
            color: "#87CEFA",
            words: [

                Word(english: "Weather", vietnamese: "Thời tiết", emoji: "🌦", example: "The weather is nice today.", exampleVietnamese: "Hôm nay thời tiết đẹp."),
                Word(english: "Sunny", vietnamese: "Nắng", emoji: "☀️", example: "It is sunny today.", exampleVietnamese: "Hôm nay trời nắng."),
                Word(english: "Rainy", vietnamese: "Mưa", emoji: "🌧️", example: "It is rainy outside.", exampleVietnamese: "Ngoài trời đang mưa."),
                Word(english: "Cloudy", vietnamese: "Nhiều mây", emoji: "☁️", example: "The sky is cloudy.", exampleVietnamese: "Bầu trời nhiều mây."),
                Word(english: "Windy", vietnamese: "Có gió", emoji: "💨", example: "It is windy today.", exampleVietnamese: "Hôm nay có gió."),
                Word(english: "Stormy", vietnamese: "Bão", emoji: "⛈️", example: "The weather is stormy.", exampleVietnamese: "Thời tiết có bão."),
                Word(english: "Hot", vietnamese: "Nóng", emoji: "🔥", example: "It is hot in summer.", exampleVietnamese: "Mùa hè rất nóng."),
                Word(english: "Cold", vietnamese: "Lạnh", emoji: "❄️", example: "It is cold today.", exampleVietnamese: "Hôm nay trời lạnh."),
                Word(english: "Warm", vietnamese: "Ấm áp", emoji: "🌤️", example: "The weather is warm.", exampleVietnamese: "Thời tiết ấm áp."),
                Word(english: "Cool", vietnamese: "Mát mẻ", emoji: "🍃", example: "It is cool this evening.", exampleVietnamese: "Buổi tối nay rất mát mẻ."),
                Word(english: "Snow", vietnamese: "Tuyết", emoji: "❄️", example: "Snow is white.", exampleVietnamese: "Tuyết màu trắng."),
                Word(english: "Fog", vietnamese: "Sương mù", emoji: "🌫️", example: "There is a lot of fog.", exampleVietnamese: "Có rất nhiều sương mù."),
                Word(english: "Thunder", vietnamese: "Sấm", emoji: "⚡", example: "I hear thunder.", exampleVietnamese: "Tôi nghe thấy tiếng sấm."),
                Word(english: "Lightning", vietnamese: "Tia chớp", emoji: "⚡", example: "The lightning is bright.", exampleVietnamese: "Tia chớp rất sáng."),
                Word(english: "Rainbow", vietnamese: "Cầu vồng", emoji: "🌈", example: "I can see a rainbow.", exampleVietnamese: "Tôi nhìn thấy cầu vồng.")
            ]
        ),
        Topic(
            id: "transportation",
            name: "Transportation",
            nameVi: "Phương tiện giao thông",
            emoji: "🚗",
            color: "#40E0D0",
            words: [

                Word(english: "Car", vietnamese: "Ô tô", emoji: "🚗", example: "My father drives a car.", exampleVietnamese: "Bố tôi lái ô tô."),
                Word(english: "Bus", vietnamese: "Xe buýt", emoji: "🚌", example: "I go to school by bus.", exampleVietnamese: "Tôi đi học bằng xe buýt."),
                Word(english: "Bicycle", vietnamese: "Xe đạp", emoji: "🚲", example: "I ride a bicycle.", exampleVietnamese: "Tôi đi xe đạp."),
                Word(english: "Motorbike", vietnamese: "Xe máy", emoji: "🏍️", example: "My mother rides a motorbike.", exampleVietnamese: "Mẹ tôi đi xe máy."),
                Word(english: "Train", vietnamese: "Tàu hỏa", emoji: "🚆", example: "The train is fast.", exampleVietnamese: "Tàu hỏa rất nhanh."),
                Word(english: "Airplane", vietnamese: "Máy bay", emoji: "✈️", example: "The airplane is flying.", exampleVietnamese: "Máy bay đang bay."),
                Word(english: "Boat", vietnamese: "Thuyền", emoji: "🚤", example: "The boat is on the river.", exampleVietnamese: "Con thuyền ở trên sông."),
                Word(english: "Ship", vietnamese: "Tàu thủy", emoji: "🚢", example: "The ship is large.", exampleVietnamese: "Con tàu rất lớn."),
                Word(english: "Taxi", vietnamese: "Taxi", emoji: "🚕", example: "We take a taxi.", exampleVietnamese: "Chúng tôi đi taxi."),
                Word(english: "Helicopter", vietnamese: "Trực thăng", emoji: "🚁", example: "The helicopter is in the sky.", exampleVietnamese: "Trực thăng ở trên trời.")
            ]
        ),
        Topic(
            id: "sports",
            name: "Sports",
            nameVi: "Thể thao",
            emoji: "⚽",
            color: "#32CD32",
            words: [

                Word(english: "Football", vietnamese: "Bóng đá", emoji: "⚽", example: "I play football.", exampleVietnamese: "Tôi chơi bóng đá."),
                Word(english: "Basketball", vietnamese: "Bóng rổ", emoji: "🏀", example: "Basketball is fun.", exampleVietnamese: "Bóng rổ rất vui."),
                Word(english: "Volleyball", vietnamese: "Bóng chuyền", emoji: "🏐", example: "We play volleyball.", exampleVietnamese: "Chúng tôi chơi bóng chuyền."),
                Word(english: "Badminton", vietnamese: "Cầu lông", emoji: "🏸", example: "I like badminton.", exampleVietnamese: "Tôi thích cầu lông."),
                Word(english: "Tennis", vietnamese: "Quần vợt", emoji: "🎾", example: "She plays tennis.", exampleVietnamese: "Cô ấy chơi quần vợt."),
                Word(english: "Swimming", vietnamese: "Bơi lội", emoji: "🏊", example: "Swimming is healthy.", exampleVietnamese: "Bơi lội tốt cho sức khỏe."),
                Word(english: "Running", vietnamese: "Chạy bộ", emoji: "🏃", example: "I go running every morning.", exampleVietnamese: "Tôi chạy bộ mỗi sáng."),
                Word(english: "Cycling", vietnamese: "Đạp xe", emoji: "🚴", example: "Cycling is good exercise.", exampleVietnamese: "Đạp xe là bài tập tốt."),
                Word(english: "Baseball", vietnamese: "Bóng chày", emoji: "⚾", example: "Baseball is popular.", exampleVietnamese: "Bóng chày rất phổ biến."),
                Word(english: "Golf", vietnamese: "Golf", emoji: "⛳", example: "He plays golf.", exampleVietnamese: "Anh ấy chơi golf.")
            ]
        ),
        Topic(
            id: "nature",
            name: "Nature",
            nameVi: "Thiên nhiên",
            emoji: "🌳",
            color: "#228B22",
            words: [

                Word(english: "Tree", vietnamese: "Cây", emoji: "🌳", example: "The tree is tall.", exampleVietnamese: "Cái cây rất cao."),
                Word(english: "Flower", vietnamese: "Hoa", emoji: "🌸", example: "The flower is beautiful.", exampleVietnamese: "Bông hoa rất đẹp."),
                Word(english: "Grass", vietnamese: "Cỏ", emoji: "🌱", example: "The grass is green.", exampleVietnamese: "Cỏ màu xanh."),
                Word(english: "Mountain", vietnamese: "Núi", emoji: "⛰️", example: "The mountain is high.", exampleVietnamese: "Ngọn núi rất cao."),
                Word(english: "River", vietnamese: "Sông", emoji: "🏞️", example: "The river is long.", exampleVietnamese: "Con sông rất dài."),
                Word(english: "Sea", vietnamese: "Biển", emoji: "🌊", example: "The sea is beautiful.", exampleVietnamese: "Biển rất đẹp."),
                Word(english: "Lake", vietnamese: "Hồ", emoji: "🏞️", example: "The lake is calm.", exampleVietnamese: "Hồ rất yên bình."),
                Word(english: "Forest", vietnamese: "Rừng", emoji: "🌲", example: "Many animals live in the forest.", exampleVietnamese: "Nhiều động vật sống trong rừng."),
                Word(english: "Sky", vietnamese: "Bầu trời", emoji: "☁️", example: "The sky is blue.", exampleVietnamese: "Bầu trời màu xanh."),
                Word(english: "Sun", vietnamese: "Mặt trời", emoji: "☀️", example: "The sun is bright.", exampleVietnamese: "Mặt trời rất sáng."),
                Word(english: "Moon", vietnamese: "Mặt trăng", emoji: "🌙", example: "The moon is beautiful tonight.", exampleVietnamese: "Mặt trăng tối nay rất đẹp."),
                Word(english: "Star", vietnamese: "Ngôi sao", emoji: "⭐", example: "I can see a star.", exampleVietnamese: "Tôi có thể nhìn thấy một ngôi sao."),
                Word(english: "Rock", vietnamese: "Đá", emoji: "🪨", example: "The rock is heavy.", exampleVietnamese: "Hòn đá rất nặng."),
                Word(english: "Beach", vietnamese: "Bãi biển", emoji: "🏖️", example: "We play on the beach.", exampleVietnamese: "Chúng tôi chơi trên bãi biển."),
                Word(english: "Leaf", vietnamese: "Lá cây", emoji: "🍃", example: "The leaf is green.", exampleVietnamese: "Chiếc lá màu xanh.")
            ]
        )
    ]
}
