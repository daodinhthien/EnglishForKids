import Foundation

// MARK: - Dialogue Models

struct DialogueTopic: Codable {
    let id: String
    let emoji: String
    let label: String
    let labelVn: String
    let title: String
    let subtitle: String
    let lines: [DialogueLine]
}

struct DialogueLine: Codable {
    let speaker: String
    let avatar: String
    let side: Side
    let english: String
    let vietnamese: String
}

enum Side: String, Codable {
    case left
    case right
}

// MARK: - Exercise Models

struct FillExercise: Codable {
    let parts: [String]       // "__" marks the blank
    let answer: String
    let hint: String
    let wordBank: [String]
}

struct MatchPair: Codable {
    let left: String
    let right: String
}

struct PictureQuestion: Codable {
    let question: String
    let options: [PictureOption]
    let correctIndex: Int
}

struct PictureOption: Codable {
    let emoji: String
    let label: String
}

struct ArrangeExercise: Codable {
    let hint: String
    let words: [String]
    let answer: String
}

// MARK: - Static Data

enum AppData {

    static let dialogues: [DialogueTopic] = [
        DialogueTopic(
            id: "greeting", emoji: "👋", label: "Greetings", labelVn: "Chào hỏi",
            title: "Hello! How are you?", subtitle: "Chào hỏi cơ bản",
            lines: [
                DialogueLine(speaker: "Tom", avatar: "👦", side: .left,  english: "Hello! My name is Tom.", vietnamese: "Xin chào! Tên tôi là Tom."),
                DialogueLine(speaker: "Anna", avatar: "👧", side: .right, english: "Hi Tom! I am Anna. Nice to meet you!", vietnamese: "Chào Tom! Tôi là Anna. Rất vui được gặp bạn!"),
                DialogueLine(speaker: "Tom", avatar: "👦", side: .left,  english: "Nice to meet you too! How are you?", vietnamese: "Tôi cũng rất vui! Bạn có khỏe không?"),
                DialogueLine(speaker: "Anna", avatar: "👧", side: .right, english: "I am fine, thank you! And you?", vietnamese: "Tôi khỏe, cảm ơn! Còn bạn thì sao?"),
                DialogueLine(speaker: "Tom", avatar: "👦", side: .left,  english: "I am great! See you tomorrow!", vietnamese: "Tôi rất tốt! Hẹn gặp lại ngày mai!"),
                DialogueLine(speaker: "Anna", avatar: "👧", side: .right, english: "Goodbye, Tom!", vietnamese: "Tạm biệt, Tom!"),
            ]
        ),
        DialogueTopic(
            id: "family", emoji: "👨‍👩‍👧", label: "My Family", labelVn: "Gia đình tôi",
            title: "Tell me about your family", subtitle: "Nói về gia đình",
            lines: [
                DialogueLine(speaker: "Teacher", avatar: "👩‍🏫", side: .left,  english: "How many people are in your family?", vietnamese: "Gia đình bạn có bao nhiêu người?"),
                DialogueLine(speaker: "Ben", avatar: "👦", side: .right, english: "There are four people in my family.", vietnamese: "Gia đình tôi có bốn người."),
                DialogueLine(speaker: "Teacher", avatar: "👩‍🏫", side: .left,  english: "Who are they?", vietnamese: "Họ là ai vậy?"),
                DialogueLine(speaker: "Ben", avatar: "👦", side: .right, english: "My father, my mother, my sister and me!", vietnamese: "Bố tôi, mẹ tôi, chị gái tôi và tôi!"),
                DialogueLine(speaker: "Teacher", avatar: "👩‍🏫", side: .left,  english: "That is a lovely family!", vietnamese: "Thật là một gia đình đáng yêu!"),
            ]
        ),
        DialogueTopic(
            id: "school", emoji: "🏫", label: "At School", labelVn: "Ở trường",
            title: "What is your favourite subject?", subtitle: "Môn học yêu thích",
            lines: [
                DialogueLine(speaker: "Lily", avatar: "👧", side: .left,  english: "What is your favourite subject?", vietnamese: "Môn học yêu thích của bạn là gì?"),
                DialogueLine(speaker: "Minh", avatar: "🧒", side: .right, english: "I like Maths! It is fun!", vietnamese: "Tôi thích Toán! Nó rất thú vị!"),
                DialogueLine(speaker: "Lily", avatar: "👧", side: .left,  english: "Really? I like English the most.", vietnamese: "Thật sao? Tôi thích Tiếng Anh nhất."),
                DialogueLine(speaker: "Minh", avatar: "🧒", side: .right, english: "Do you have homework today?", vietnamese: "Hôm nay bạn có bài tập về nhà không?"),
                DialogueLine(speaker: "Lily", avatar: "👧", side: .left,  english: "Yes! Let's do it together!", vietnamese: "Có! Cùng làm bài nào!"),
            ]
        ),
        DialogueTopic(
            id: "food", emoji: "🍎", label: "Food & Drink", labelVn: "Đồ ăn & uống",
            title: "Do you like fruit?", subtitle: "Đồ ăn yêu thích",
            lines: [
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left,  english: "Do you want some fruit?", vietnamese: "Con có muốn ăn hoa quả không?"),
                DialogueLine(speaker: "Jack", avatar: "👦", side: .right, english: "Yes, please! I love apples.", vietnamese: "Dạ có! Con thích táo lắm."),
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left,  english: "Do you like bananas too?", vietnamese: "Con có thích chuối không?"),
                DialogueLine(speaker: "Jack", avatar: "👦", side: .right, english: "No, I don't like bananas. They are too sweet!", vietnamese: "Không ạ, con không thích chuối. Ngọt quá!"),
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left,  english: "How about orange juice?", vietnamese: "Thế nước cam thì sao?"),
                DialogueLine(speaker: "Jack", avatar: "👦", side: .right, english: "Yes! Orange juice is my favourite!", vietnamese: "Có ạ! Nước cam là món yêu thích của con!"),
            ]
        ),
        DialogueTopic(
            id: "weather", emoji: "☀️", label: "Weather", labelVn: "Thời tiết",
            title: "What is the weather like?", subtitle: "Nói về thời tiết",
            lines: [
                DialogueLine(speaker: "Anna", avatar: "👧", side: .left,  english: "What is the weather like today?", vietnamese: "Hôm nay thời tiết thế nào?"),
                DialogueLine(speaker: "Tom", avatar: "👦", side: .right, english: "It is sunny and warm!", vietnamese: "Trời nắng và ấm!"),
                DialogueLine(speaker: "Anna", avatar: "👧", side: .left,  english: "Great! Let's play outside!", vietnamese: "Tuyệt! Chúng ta ra ngoài chơi nhé!"),
                DialogueLine(speaker: "Tom", avatar: "👦", side: .right, english: "Wait! I need my hat. It is very hot.", vietnamese: "Chờ đã! Tôi cần cái mũ. Nắng lắm đó."),
                DialogueLine(speaker: "Anna", avatar: "👧", side: .left,  english: "Good idea! I will bring water too.", vietnamese: "Ý hay đó! Mình mang nước theo nữa."),
            ]
        ),
        DialogueTopic(
            id: "animals", emoji: "🐶", label: "Animals", labelVn: "Động vật",
            title: "Do you have a pet?", subtitle: "Thú cưng",
            lines: [
                DialogueLine(speaker: "Sara", avatar: "👧", side: .left,  english: "Do you have a pet?", vietnamese: "Bạn có nuôi thú cưng không?"),
                DialogueLine(speaker: "Leo", avatar: "🧒", side: .right, english: "Yes! I have a dog. His name is Buddy.", vietnamese: "Có! Mình có một con chó. Nó tên là Buddy."),
                DialogueLine(speaker: "Sara", avatar: "👧", side: .left,  english: "How cute! What colour is he?", vietnamese: "Dễ thương quá! Nó màu gì vậy?"),
                DialogueLine(speaker: "Leo", avatar: "🧒", side: .right, english: "He is brown and white. He is very friendly!", vietnamese: "Nó màu nâu và trắng. Nó rất thân thiện!"),
                DialogueLine(speaker: "Sara", avatar: "👧", side: .left,  english: "I want a cat. Cats are my favourite animals.", vietnamese: "Mình muốn nuôi mèo. Mèo là động vật mình thích nhất."),
            ]
        ),
        DialogueTopic(
            id: "birthday", emoji: "🎂", label: "Birthday Party", labelVn: "Tiệc sinh nhật",
            title: "Happy Birthday!", subtitle: "Mừng sinh nhật",
            lines: [
                DialogueLine(speaker: "Emma", avatar: "👧", side: .left, english: "Happy birthday, Ben!", vietnamese: "Chúc mừng sinh nhật Ben!"),
                DialogueLine(speaker: "Ben", avatar: "👦", side: .right, english: "Thank you, Emma!", vietnamese: "Cảm ơn Emma!"),
                DialogueLine(speaker: "Emma", avatar: "👧", side: .left, english: "How old are you now?", vietnamese: "Bây giờ bạn bao nhiêu tuổi rồi?"),
                DialogueLine(speaker: "Ben", avatar: "👦", side: .right, english: "I am nine years old.", vietnamese: "Mình chín tuổi rồi."),
                DialogueLine(speaker: "Emma", avatar: "👧", side: .left, english: "Have a great birthday!", vietnamese: "Chúc bạn có sinh nhật thật vui!"),
            ]
        ),

        DialogueTopic(
            id: "playground", emoji: "🛝", label: "Playground", labelVn: "Sân chơi",
            title: "Let's play together",
            subtitle: "Rủ bạn cùng chơi",
            lines: [
                DialogueLine(speaker: "Tom", avatar: "👦", side: .left, english: "Do you want to play football?", vietnamese: "Bạn có muốn chơi đá bóng không?"),
                DialogueLine(speaker: "Nam", avatar: "🧒", side: .right, english: "Yes, I do!", vietnamese: "Có chứ!"),
                DialogueLine(speaker: "Tom", avatar: "👦", side: .left, english: "Let's go to the playground.", vietnamese: "Chúng ta ra sân chơi nhé."),
                DialogueLine(speaker: "Nam", avatar: "🧒", side: .right, english: "Great idea!", vietnamese: "Ý hay đấy!"),
                DialogueLine(speaker: "Tom", avatar: "👦", side: .left, english: "I will bring the ball.", vietnamese: "Mình sẽ mang theo quả bóng."),
            ]
        ),

        DialogueTopic(
            id: "shopping", emoji: "🛒", label: "Shopping", labelVn: "Mua sắm",
            title: "At the supermarket",
            subtitle: "Đi siêu thị",
            lines: [
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left, english: "Can you help me shop?", vietnamese: "Con có thể giúp mẹ mua sắm không?"),
                DialogueLine(speaker: "Lucy", avatar: "👧", side: .right, english: "Of course, Mum!", vietnamese: "Tất nhiên rồi mẹ!"),
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left, english: "Please get some milk.", vietnamese: "Lấy giúp mẹ ít sữa nhé."),
                DialogueLine(speaker: "Lucy", avatar: "👧", side: .right, english: "Here you are.", vietnamese: "Đây ạ."),
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left, english: "Thank you, Lucy.", vietnamese: "Cảm ơn con nhé Lucy."),
            ]
        ),

        DialogueTopic(
            id: "library", emoji: "📚", label: "Library", labelVn: "Thư viện",
            title: "Reading books",
            subtitle: "Đọc sách",
            lines: [
                DialogueLine(speaker: "Teacher", avatar: "👩‍🏫", side: .left, english: "Do you like reading books?", vietnamese: "Em có thích đọc sách không?"),
                DialogueLine(speaker: "Mai", avatar: "👧", side: .right, english: "Yes, I love books.", vietnamese: "Có ạ, em rất thích sách."),
                DialogueLine(speaker: "Teacher", avatar: "👩‍🏫", side: .left, english: "What book do you want?", vietnamese: "Em muốn cuốn sách nào?"),
                DialogueLine(speaker: "Mai", avatar: "👧", side: .right, english: "I want a story book.", vietnamese: "Em muốn một cuốn truyện."),
                DialogueLine(speaker: "Teacher", avatar: "👩‍🏫", side: .left, english: "Good choice!", vietnamese: "Lựa chọn rất tốt!"),
            ]
        ),

        DialogueTopic(
            id: "sports", emoji: "⚽", label: "Sports", labelVn: "Thể thao",
            title: "My favourite sport",
            subtitle: "Môn thể thao yêu thích",
            lines: [
                DialogueLine(speaker: "Linh", avatar: "👧", side: .left, english: "What is your favourite sport?", vietnamese: "Môn thể thao yêu thích của bạn là gì?"),
                DialogueLine(speaker: "Phong", avatar: "🧒", side: .right, english: "I like football.", vietnamese: "Mình thích bóng đá."),
                DialogueLine(speaker: "Linh", avatar: "👧", side: .left, english: "Do you play every day?", vietnamese: "Bạn có chơi mỗi ngày không?"),
                DialogueLine(speaker: "Phong", avatar: "🧒", side: .right, english: "Yes, after school.", vietnamese: "Có, sau giờ học."),
                DialogueLine(speaker: "Linh", avatar: "👧", side: .left, english: "That's wonderful!", vietnamese: "Tuyệt quá!"),
            ]
        ),

        DialogueTopic(
            id: "morning", emoji: "🌅", label: "Morning Routine", labelVn: "Buổi sáng",
            title: "Good morning",
            subtitle: "Thói quen buổi sáng",
            lines: [
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left, english: "Good morning, Sam!", vietnamese: "Chào buổi sáng Sam!"),
                DialogueLine(speaker: "Sam", avatar: "👦", side: .right, english: "Good morning, Mum!", vietnamese: "Chào buổi sáng mẹ!"),
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left, english: "Did you brush your teeth?", vietnamese: "Con đánh răng chưa?"),
                DialogueLine(speaker: "Sam", avatar: "👦", side: .right, english: "Yes, I did.", vietnamese: "Rồi ạ."),
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left, english: "Great! Let's have breakfast.", vietnamese: "Tốt lắm! Ăn sáng thôi nào."),
            ]
        ),
        DialogueTopic(
            id: "weekend", emoji: "🏖️", label: "Weekend", labelVn: "Cuối tuần",
            title: "What do you do on weekends?",
            subtitle: "Hoạt động cuối tuần",
            lines: [
                DialogueLine(speaker: "Anna", avatar: "👧", side: .left, english: "What do you do on weekends?", vietnamese: "Bạn làm gì vào cuối tuần?"),
                DialogueLine(speaker: "Ben", avatar: "👦", side: .right, english: "I ride my bike.", vietnamese: "Mình đi xe đạp."),
                DialogueLine(speaker: "Anna", avatar: "👧", side: .left, english: "That sounds fun!", vietnamese: "Nghe vui đấy!"),
                DialogueLine(speaker: "Ben", avatar: "👦", side: .right, english: "Yes! I go with my friends.", vietnamese: "Ừ! Mình đi cùng bạn bè."),
            ]
        ),

        DialogueTopic(
            id: "toy", emoji: "🧸", label: "Toys", labelVn: "Đồ chơi",
            title: "My favourite toy",
            subtitle: "Đồ chơi yêu thích",
            lines: [
                DialogueLine(speaker: "Lucy", avatar: "👧", side: .left, english: "What is your favourite toy?", vietnamese: "Đồ chơi yêu thích của bạn là gì?"),
                DialogueLine(speaker: "Tom", avatar: "👦", side: .right, english: "My robot toy.", vietnamese: "Robot đồ chơi của mình."),
                DialogueLine(speaker: "Lucy", avatar: "👧", side: .left, english: "Can it move?", vietnamese: "Nó có thể di chuyển không?"),
                DialogueLine(speaker: "Tom", avatar: "👦", side: .right, english: "Yes, it can walk!", vietnamese: "Có, nó có thể đi được!"),
            ]
        ),

        DialogueTopic(
            id: "colors", emoji: "🎨", label: "Colors", labelVn: "Màu sắc",
            title: "What is your favourite color?",
            subtitle: "Màu sắc yêu thích",
            lines: [
                DialogueLine(speaker: "Mai", avatar: "👧", side: .left, english: "What is your favourite color?", vietnamese: "Màu yêu thích của bạn là gì?"),
                DialogueLine(speaker: "Nam", avatar: "🧒", side: .right, english: "Blue is my favourite color.", vietnamese: "Màu xanh dương là màu mình thích nhất."),
                DialogueLine(speaker: "Mai", avatar: "👧", side: .left, english: "Mine is pink.", vietnamese: "Mình thích màu hồng."),
                DialogueLine(speaker: "Nam", avatar: "🧒", side: .right, english: "Pink is beautiful.", vietnamese: "Màu hồng rất đẹp."),
            ]
        ),

        DialogueTopic(
            id: "clothes", emoji: "👕", label: "Clothes", labelVn: "Quần áo",
            title: "What are you wearing?",
            subtitle: "Quần áo",
            lines: [
                DialogueLine(speaker: "Teacher", avatar: "👩‍🏫", side: .left, english: "What are you wearing today?", vietnamese: "Hôm nay em đang mặc gì?"),
                DialogueLine(speaker: "Linh", avatar: "👧", side: .right, english: "I am wearing a blue shirt.", vietnamese: "Em đang mặc áo xanh."),
                DialogueLine(speaker: "Teacher", avatar: "👩‍🏫", side: .left, english: "Very nice!", vietnamese: "Đẹp lắm!"),
                DialogueLine(speaker: "Linh", avatar: "👧", side: .right, english: "Thank you!", vietnamese: "Em cảm ơn cô!"),
            ]
        ),

        DialogueTopic(
            id: "zoo", emoji: "🦁", label: "At The Zoo", labelVn: "Sở thú",
            title: "Let's visit the zoo",
            subtitle: "Đi sở thú",
            lines: [
                DialogueLine(speaker: "Dad", avatar: "👨", side: .left, english: "Do you want to visit the zoo?", vietnamese: "Con có muốn đi sở thú không?"),
                DialogueLine(speaker: "Alex", avatar: "👦", side: .right, english: "Yes! I want to see lions.", vietnamese: "Có! Con muốn xem sư tử."),
                DialogueLine(speaker: "Dad", avatar: "👨", side: .left, english: "And elephants too.", vietnamese: "Cả voi nữa nhé."),
                DialogueLine(speaker: "Alex", avatar: "👦", side: .right, english: "Great!", vietnamese: "Tuyệt quá!"),
            ]
        ),

        DialogueTopic(
            id: "doctor", emoji: "👨‍⚕️", label: "Doctor", labelVn: "Bác sĩ",
            title: "I don't feel well",
            subtitle: "Khám bệnh",
            lines: [
                DialogueLine(speaker: "Doctor", avatar: "👨‍⚕️", side: .left, english: "What is the matter?", vietnamese: "Con bị sao vậy?"),
                DialogueLine(speaker: "Sam", avatar: "👦", side: .right, english: "I have a headache.", vietnamese: "Con bị đau đầu."),
                DialogueLine(speaker: "Doctor", avatar: "👨‍⚕️", side: .left, english: "Drink more water and rest.", vietnamese: "Hãy uống nhiều nước và nghỉ ngơi."),
                DialogueLine(speaker: "Sam", avatar: "👦", side: .right, english: "Thank you, doctor.", vietnamese: "Cảm ơn bác sĩ."),
            ]
        ),

        DialogueTopic(
            id: "computer", emoji: "💻", label: "Computer", labelVn: "Máy tính",
            title: "Using a computer",
            subtitle: "Máy tính",
            lines: [
                DialogueLine(speaker: "Dad", avatar: "👨", side: .left, english: "Can you use a computer?", vietnamese: "Con có biết dùng máy tính không?"),
                DialogueLine(speaker: "Kate", avatar: "👧", side: .right, english: "Yes, I can.", vietnamese: "Có ạ."),
                DialogueLine(speaker: "Dad", avatar: "👨", side: .left, english: "What do you do on it?", vietnamese: "Con dùng nó để làm gì?"),
                DialogueLine(speaker: "Kate", avatar: "👧", side: .right, english: "I learn English.", vietnamese: "Con học tiếng Anh."),
            ]
        ),

        DialogueTopic(
            id: "music", emoji: "🎵", label: "Music", labelVn: "Âm nhạc",
            title: "Do you like music?",
            subtitle: "Âm nhạc",
            lines: [
                DialogueLine(speaker: "Emma", avatar: "👧", side: .left, english: "Do you like music?", vietnamese: "Bạn có thích âm nhạc không?"),
                DialogueLine(speaker: "Leo", avatar: "🧒", side: .right, english: "Yes, I love music.", vietnamese: "Có, mình rất thích âm nhạc."),
                DialogueLine(speaker: "Emma", avatar: "👧", side: .left, english: "Can you sing?", vietnamese: "Bạn có biết hát không?"),
                DialogueLine(speaker: "Leo", avatar: "🧒", side: .right, english: "Yes, a little.", vietnamese: "Có, một chút."),
            ]
        ),

        DialogueTopic(
            id: "breakfast", emoji: "🥞", label: "Breakfast", labelVn: "Bữa sáng",
            title: "Breakfast time",
            subtitle: "Ăn sáng",
            lines: [
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left, english: "What would you like for breakfast?", vietnamese: "Con muốn ăn gì cho bữa sáng?"),
                DialogueLine(speaker: "Ben", avatar: "👦", side: .right, english: "I would like some bread and milk.", vietnamese: "Con muốn bánh mì và sữa."),
                DialogueLine(speaker: "Mum", avatar: "👩", side: .left, english: "Here you are.", vietnamese: "Đây nhé."),
                DialogueLine(speaker: "Ben", avatar: "👦", side: .right, english: "Thank you, Mum.", vietnamese: "Cảm ơn mẹ."),
            ]
        ),

        DialogueTopic(
            id: "friend", emoji: "🤝", label: "New Friend", labelVn: "Bạn mới",
            title: "Making friends",
            subtitle: "Làm quen bạn mới",
            lines: [
                DialogueLine(speaker: "Hoa", avatar: "👧", side: .left, english: "Hello! What's your name?", vietnamese: "Xin chào! Bạn tên là gì?"),
                DialogueLine(speaker: "Peter", avatar: "👦", side: .right, english: "My name is Peter.", vietnamese: "Tên mình là Peter."),
                DialogueLine(speaker: "Hoa", avatar: "👧", side: .left, english: "Nice to meet you.", vietnamese: "Rất vui được gặp bạn."),
                DialogueLine(speaker: "Peter", avatar: "👦", side: .right, english: "Nice to meet you too.", vietnamese: "Mình cũng rất vui được gặp bạn."),
            ]
        ),
    ]

    static let fillExercises: [FillExercise] = [
        FillExercise(parts: ["My name", "__", "I am eight years old."], answer: "is", hint: "Điền từ còn thiếu", wordBank: ["is", "am", "are", "be"]),
        FillExercise(parts: ["__", "are you?", "I am fine, thank you!"], answer: "How", hint: "Điền từ còn thiếu", wordBank: ["How", "What", "Where", "Who"]),
        FillExercise(parts: ["I have a", "__", "She is cute and fluffy."], answer: "cat.", hint: "Điền từ còn thiếu", wordBank: ["cat.", "apple", "book", "school"]),
        FillExercise(parts: ["Today is", "__", "I go to school."], answer: "Monday.", hint: "Điền từ còn thiếu", wordBank: ["Monday.", "sunny", "big", "green"]),
        FillExercise(parts: ["I", "__", "a student."], answer: "am", hint: "Điền từ còn thiếu", wordBank: ["am","is","are","be"]),
        FillExercise(parts: ["She", "__", "my friend."], answer: "is", hint: "Điền từ còn thiếu", wordBank: ["is","am","are","be"]),
        FillExercise(parts: ["They", "__", "playing football."], answer: "are", hint: "Điền từ còn thiếu", wordBank: ["am","is","are","be"]),
        FillExercise(parts: ["This is", "__", "apple."], answer: "an", hint: "Điền từ còn thiếu", wordBank: ["a","an","the","is"]),
        FillExercise(parts: ["I have", "__", "dog."], answer: "a", hint: "Điền từ còn thiếu", wordBank: ["a","an","the","is"]),
        FillExercise(parts: ["The cat is", "__", "the table."], answer: "under", hint: "Điền từ còn thiếu", wordBank: ["under","on","in","at"]),
        FillExercise(parts: ["The book is", "__", "the desk."], answer: "on", hint: "Điền từ còn thiếu", wordBank: ["on","under","behind","next"]),
        FillExercise(parts: ["My birthday is", "__", "May."], answer: "in", hint: "Điền từ còn thiếu", wordBank: ["on","at","in","to"]),
        FillExercise(parts: ["I go to school", "__", "Monday."], answer: "on", hint: "Điền từ còn thiếu", wordBank: ["in","on","at","to"]),
        FillExercise(parts: ["Can you swim?", "__", "I can."], answer: "Yes,", hint: "Điền từ còn thiếu", wordBank: ["Yes,","No,","Please","Hello"]),
        FillExercise(parts: ["What", "__", "your name?"], answer: "is", hint: "Điền từ còn thiếu", wordBank: ["is","am","are","be"]),
        FillExercise(parts: ["How old", "__", "you?"], answer: "are", hint: "Điền từ còn thiếu", wordBank: ["is","am","are","be"]),
        FillExercise(parts: ["My favourite", "__", "is blue."], answer: "color", hint: "Điền từ còn thiếu", wordBank: ["color","food","animal","day"]),
        FillExercise(parts: ["I like", "__", "English books."], answer: "reading", hint: "Điền từ còn thiếu", wordBank: ["reading","read","reads","reader"]),
        FillExercise(parts: ["The weather is", "__", "today."], answer: "sunny", hint: "Điền từ còn thiếu", wordBank: ["sunny","apple","teacher","table"]),
        FillExercise(parts: ["I drink", "__", "every morning."], answer: "milk", hint: "Điền từ còn thiếu", wordBank: ["milk","chair","school","pencil"]),
        FillExercise(parts: ["My mother is", "__", "teacher."], answer: "a", hint: "Điền từ còn thiếu", wordBank: ["a","an","the","is"]),
        FillExercise(parts: ["We play football in the", "__"], answer: "playground", hint: "Điền từ còn thiếu", wordBank: ["playground","kitchen","bedroom","library"]),
        FillExercise(parts: ["I brush my", "__", "every day."], answer: "teeth", hint: "Điền từ còn thiếu", wordBank: ["teeth","apple","toy","dog"]),
        FillExercise(parts: ["There are seven days in a", "__"], answer: "week", hint: "Điền từ còn thiếu", wordBank: ["week","month","year","hour"]),
    ]

    static let matchPairs: [MatchPair] = [
        MatchPair(left: "apple 🍎", right: "quả táo"),
        MatchPair(left: "happy 😊", right: "vui vẻ"),
        MatchPair(left: "school 🏫", right: "trường học"),
        MatchPair(left: "dog 🐶", right: "con chó"),
        MatchPair(left: "sunny ☀️", right: "trời nắng"),
        MatchPair(left: "cat 🐱", right: "con mèo"),
        MatchPair(left: "bird 🐦", right: "con chim"),
        MatchPair(left: "fish 🐟", right: "con cá"),
        MatchPair(left: "rabbit 🐰", right: "con thỏ"),
        MatchPair(left: "lion 🦁", right: "con sư tử"),
        MatchPair(left: "tiger 🐯", right: "con hổ"),
        MatchPair(left: "elephant 🐘", right: "con voi"),
        MatchPair(left: "monkey 🐵", right: "con khỉ"),
        MatchPair(left: "bear 🐻", right: "con gấu"),
        MatchPair(left: "horse 🐴", right: "con ngựa"),

        MatchPair(left: "red ❤️", right: "màu đỏ"),
        MatchPair(left: "blue 💙", right: "màu xanh dương"),
        MatchPair(left: "green 💚", right: "màu xanh lá"),
        MatchPair(left: "yellow 💛", right: "màu vàng"),
        MatchPair(left: "black 🖤", right: "màu đen"),
        MatchPair(left: "white 🤍", right: "màu trắng"),
        MatchPair(left: "pink 🩷", right: "màu hồng"),
        MatchPair(left: "orange 🧡", right: "màu cam"),
        MatchPair(left: "purple 💜", right: "màu tím"),
        MatchPair(left: "brown 🤎", right: "màu nâu"),

        MatchPair(left: "book 📚", right: "quyển sách"),
        MatchPair(left: "pencil ✏️", right: "bút chì"),
        MatchPair(left: "eraser 🩹", right: "cục tẩy"),
        MatchPair(left: "ruler 📏", right: "thước kẻ"),
        MatchPair(left: "school bag 🎒", right: "cặp sách"),
        MatchPair(left: "desk 🪑", right: "bàn học"),
        MatchPair(left: "chair 🪑", right: "ghế"),
        MatchPair(left: "teacher 👩‍🏫", right: "giáo viên"),
        MatchPair(left: "student 🧒", right: "học sinh"),
        MatchPair(left: "classroom 🏫", right: "lớp học"),

        MatchPair(left: "apple 🍎", right: "quả táo"),
        MatchPair(left: "banana 🍌", right: "quả chuối"),
        MatchPair(left: "orange 🍊", right: "quả cam"),
        MatchPair(left: "grape 🍇", right: "quả nho"),
        MatchPair(left: "watermelon 🍉", right: "quả dưa hấu"),
        MatchPair(left: "milk 🥛", right: "sữa"),
        MatchPair(left: "bread 🍞", right: "bánh mì"),
        MatchPair(left: "rice 🍚", right: "cơm"),
        MatchPair(left: "egg 🥚", right: "trứng"),
        MatchPair(left: "juice 🧃", right: "nước ép"),

        MatchPair(left: "sunny ☀️", right: "trời nắng"),
        MatchPair(left: "rainy 🌧️", right: "trời mưa"),
        MatchPair(left: "cloudy ☁️", right: "nhiều mây"),
        MatchPair(left: "snowy ❄️", right: "trời tuyết"),
        MatchPair(left: "windy 💨", right: "có gió"),

        MatchPair(left: "mother 👩", right: "mẹ"),
        MatchPair(left: "father 👨", right: "bố"),
        MatchPair(left: "brother 👦", right: "anh/em trai"),
        MatchPair(left: "sister 👧", right: "chị/em gái"),
        MatchPair(left: "family 👨‍👩‍👧‍👦", right: "gia đình"),
    ]

    static let pictureQuestions: [PictureQuestion] = [
        PictureQuestion(question: "Which picture shows a CAT? 🐱",
            options: [PictureOption(emoji:"🐱",label:"cat"), PictureOption(emoji:"🐶",label:"dog"), PictureOption(emoji:"🐟",label:"fish"), PictureOption(emoji:"🐦",label:"bird")],
            correctIndex: 0),
        PictureQuestion(question: "Which picture shows RAIN? 🌧️",
            options: [PictureOption(emoji:"☀️",label:"sunny"), PictureOption(emoji:"🌧️",label:"rain"), PictureOption(emoji:"❄️",label:"snow"), PictureOption(emoji:"🌈",label:"rainbow")],
            correctIndex: 1),
        PictureQuestion(question: "Which picture shows an APPLE? 🍎",
            options: [PictureOption(emoji:"🍌",label:"banana"), PictureOption(emoji:"🍊",label:"orange"), PictureOption(emoji:"🍎",label:"apple"), PictureOption(emoji:"🍇",label:"grape")],
            correctIndex: 2),
        PictureQuestion(question: "Which picture shows a BOOK? 📚",
            options: [PictureOption(emoji:"✏️",label:"pencil"), PictureOption(emoji:"📏",label:"ruler"), PictureOption(emoji:"🎒",label:"bag"), PictureOption(emoji:"📚",label:"book")],
            correctIndex: 3),
        PictureQuestion(
            question: "Which picture shows a DOG? 🐶",
            options: [
                PictureOption(emoji:"🐱",label:"cat"),
                PictureOption(emoji:"🐶",label:"dog"),
                PictureOption(emoji:"🐰",label:"rabbit"),
                PictureOption(emoji:"🐻",label:"bear")
            ],
            correctIndex: 1
        ),

        PictureQuestion(
            question: "Which picture shows a BANANA? 🍌",
            options: [
                PictureOption(emoji:"🍎",label:"apple"),
                PictureOption(emoji:"🍇",label:"grape"),
                PictureOption(emoji:"🍌",label:"banana"),
                PictureOption(emoji:"🍊",label:"orange")
            ],
            correctIndex: 2
        ),

        PictureQuestion(
            question: "Which picture shows the SUN? ☀️",
            options: [
                PictureOption(emoji:"🌧️",label:"rain"),
                PictureOption(emoji:"☁️",label:"cloud"),
                PictureOption(emoji:"❄️",label:"snow"),
                PictureOption(emoji:"☀️",label:"sun")
            ],
            correctIndex: 3
        ),

        PictureQuestion(
            question: "Which picture shows a FISH? 🐟",
            options: [
                PictureOption(emoji:"🐟",label:"fish"),
                PictureOption(emoji:"🐦",label:"bird"),
                PictureOption(emoji:"🐶",label:"dog"),
                PictureOption(emoji:"🐱",label:"cat")
            ],
            correctIndex: 0
        ),

        PictureQuestion(
            question: "Which picture shows MILK? 🥛",
            options: [
                PictureOption(emoji:"🥛",label:"milk"),
                PictureOption(emoji:"🧃",label:"juice"),
                PictureOption(emoji:"☕",label:"coffee"),
                PictureOption(emoji:"🍵",label:"tea")
            ],
            correctIndex: 0
        ),

        PictureQuestion(
            question: "Which picture shows a BOOK? 📚",
            options: [
                PictureOption(emoji:"📚",label:"book"),
                PictureOption(emoji:"✏️",label:"pencil"),
                PictureOption(emoji:"📏",label:"ruler"),
                PictureOption(emoji:"🎒",label:"bag")
            ],
            correctIndex: 0
        ),

        PictureQuestion(
            question: "Which picture shows a PENCIL? ✏️",
            options: [
                PictureOption(emoji:"📚",label:"book"),
                PictureOption(emoji:"✏️",label:"pencil"),
                PictureOption(emoji:"📏",label:"ruler"),
                PictureOption(emoji:"🖍️",label:"crayon")
            ],
            correctIndex: 1
        ),

        PictureQuestion(
            question: "Which picture shows an ELEPHANT? 🐘",
            options: [
                PictureOption(emoji:"🐘",label:"elephant"),
                PictureOption(emoji:"🦁",label:"lion"),
                PictureOption(emoji:"🐵",label:"monkey"),
                PictureOption(emoji:"🐯",label:"tiger")
            ],
            correctIndex: 0
        ),

        PictureQuestion(
            question: "Which picture shows a CHAIR? 🪑",
            options: [
                PictureOption(emoji:"🛏️",label:"bed"),
                PictureOption(emoji:"🚪",label:"door"),
                PictureOption(emoji:"🪑",label:"chair"),
                PictureOption(emoji:"🪟",label:"window")
            ],
            correctIndex: 2
        ),

        PictureQuestion(
            question: "Which picture shows an EGG? 🥚",
            options: [
                PictureOption(emoji:"🍞",label:"bread"),
                PictureOption(emoji:"🥚",label:"egg"),
                PictureOption(emoji:"🍚",label:"rice"),
                PictureOption(emoji:"🍎",label:"apple")
            ],
            correctIndex: 1
        ),
    ]

    static let arrangeExercises: [ArrangeExercise] = [
        ArrangeExercise(hint: "Gợi ý: Câu tự giới thiệu", words: ["name", "My", "is", "Anna"], answer: "My name is Anna"),
        ArrangeExercise(hint: "Gợi ý: Câu hỏi thăm sức khỏe", words: ["are", "How", "you", "?"], answer: "How are you ?"),
        ArrangeExercise(hint: "Gợi ý: Nói về gia đình", words: ["father", "I", "my", "love"], answer: "I love my father"),
        ArrangeExercise(hint: "Gợi ý: Nói về con vật", words: ["a", "dog", "have", "I"], answer: "I have a dog"),
        ArrangeExercise(hint: "Nói về tuổi", words: ["years","old","I","am","nine"], answer: "I am nine years old"),
        ArrangeExercise(hint: "Màu sắc yêu thích", words: ["favorite","Blue","my","is","color"], answer: "Blue is my favorite color"),
        ArrangeExercise(hint: "Giới thiệu bạn", words: ["is","friend","This","my"], answer: "This is my friend"),
        ArrangeExercise(hint: "Nói về thú cưng", words: ["cat","have","a","I"], answer: "I have a cat"),
        ArrangeExercise(hint: "Đi học", words: ["school","go","I","to"], answer: "I go to school"),
        ArrangeExercise(hint: "Môn học", words: ["English","like","I"], answer: "I like English"),
        ArrangeExercise(hint: "Gia đình", words: ["love","family","my","I"], answer: "I love my family"),
        ArrangeExercise(hint: "Chào hỏi", words: ["you","How","are"], answer: "How are you"),
        ArrangeExercise(hint: "Đồ ăn", words: ["apples","like","I"], answer: "I like apples"),
        ArrangeExercise(hint: "Con vật", words: ["dog","The","cute","is"], answer: "The dog is cute"),
        ArrangeExercise(hint: "Ngày trong tuần", words: ["today","Monday","is"], answer: "Today is Monday"),
        ArrangeExercise(hint: "Thời tiết", words: ["sunny","is","It"], answer: "It is sunny"),
        ArrangeExercise(hint: "Trường học", words: ["school","My","big","is"], answer: "My school is big"),
        ArrangeExercise(hint: "Đọc sách", words: ["books","reading","I","like"], answer: "I like reading books"),
        ArrangeExercise(hint: "Bữa sáng", words: ["milk","drink","I"], answer: "I drink milk"),
        ArrangeExercise(hint: "Sinh nhật", words: ["birthday","Happy"], answer: "Happy birthday"),
        ArrangeExercise(hint: "Sở thú", words: ["lions","see","I","can"], answer: "I can see lions"),
        ArrangeExercise(hint: "Đồ chơi", words: ["robot","My","moves"], answer: "My robot moves"),
        ArrangeExercise(hint: "Âm nhạc", words: ["music","love","I"], answer: "I love music"),
        ArrangeExercise(hint: "Máy tính", words: ["computer","a","use","I"], answer: "I use a computer"),
    ]
}
