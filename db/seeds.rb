# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
Tag.destroy_all

User.create(
  name: 'Chine',
  birth_date: DateTime.new(2000,1,1),
  email: 'canikwe@mytowne.com',
  username: 'canikwe',
  town: 'WeLive - Clarendon',
  avatar: 'http://fanaru.com/harry-potter/image/thumb/156477-harry-potter-neville-longbottom.jpg',
  bio: 'I love cheesy puns and Harry Potter.'
)

User.create(
  name: 'Chris',
  birth_date: DateTime.new(2000,1,1),
  email: 'cjones@mytowne.com',
  username: 'cjones',
  town: 'WeLive - Clarendon',
  avatar: 'https://cdn.pixabay.com/photo/2016/03/31/19/58/avatar-1295429_960_720.png',
  bio: 'A bibliophile, curator of fine charcuterie, and philosopher of the modern era.'
)

Post.create(
  title: 'Harry Potter and the Deathly Hallows: A Viewing Party!',
  content: 'Join us for a viewing party this week projected on the community center lawn. Refreshments and general discussion to follow.',
  img: 'https://secure.img1-fg.wfcdn.com/im/23411414/resize-h600-w600%5Ecompr-r85/4049/40493777/Harry+Potter+%27Book+Cover+-+Deathly+Hallows%27+Graphic+Art+Print.jpg',
  user_id: 1
)

Post.create(
  title: 'The Little Voice in Our Heads',
  content: 'A discussion on how to better listen to the calming voice inside us all.',
  img: 'https://bbkphilosophysociety.files.wordpress.com/2014/06/6a010535ce1cf6970c0163018bb9c2970d.jpg',
  user_id: 2
)

Post.create(
  title: "Cheese: An Exploration of God's Gift to Man",
  content: 'A sharing of cheese plates and your finest charcuterie. If you bring American cheese, you will be asked politely, yet firmly, to leave.',
  img: 'https://iambaker.net/wp-content/uploads/2018/02/DIY-Cheese-Tray-1.jpg',
  user_id: 2
)

Tag.create(name: 'General', post_tags_ids: [1, 2, 3])
Tag.create(name: 'Events', post_tags_ids: [1, 2, 3])
Tag.create(name: 'For sale', post_tags_ids: [3])
Tag.create(name: 'Lost', post_tags_ids: [2])
