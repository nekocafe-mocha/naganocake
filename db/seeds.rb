p 'start categories create'

Category.create!(
	[
		{ name: 'ケーキ' },
		{ name: 'プリン' },
		{ name: '焼き菓子' },
		{ name: 'キャンディ' }
	]
)

p 'finish categories create'
p 'start items create'

Item.create!(
	[
		{
			name: 'ケーキ1',
			caption: 'testtest',
			price: 500,
			category_id: Category.find_by(name: 'ケーキ').id,
			image: File.open("#{Rails.root}/app/assets/images/cake-min.jpg")
		},
		{
			name: 'ケーキ2',
			caption: 'testtest',
			price: 500,
			category_id: Category.find_by(name: 'ケーキ').id,
			image: File.open("#{Rails.root}/app/assets/images/cake-min.jpg")
		},
		{
			name: 'ケーキ3',
			caption: 'testtest',
			price: 500,
			category_id: Category.find_by(name: 'ケーキ').id,
			image: File.open("#{Rails.root}/app/assets/images/cake-min.jpg")
		},
		{
			name: 'ケーキ4',
			caption: 'testtest',
			price: 500,
			category_id: Category.find_by(name: 'ケーキ').id,
			image: File.open("#{Rails.root}/app/assets/images/cake-min.jpg")
		},
		{
			name: 'ケーキ5',
			caption: 'testtest',
			price: 500,
			category_id: Category.find_by(name: 'ケーキ').id,
			image: File.open("#{Rails.root}/app/assets/images/cake-min.jpg")
		},
		{
			name: 'プリン1',
			caption: 'testtest',
			price: 300,
			category_id: Category.find_by(name: 'プリン').id,
			image: File.open("#{Rails.root}/app/assets/images/pudding-min.jpg")
		},
		{
			name: 'プリン2',
			caption: 'testtest',
			price: 300,
			category_id: Category.find_by(name: 'プリン').id,
			image: File.open("#{Rails.root}/app/assets/images/pudding-min.jpg")
		},
		{
			name: 'プリン3',
			caption: 'testtest',
			price: 300,
			category_id: Category.find_by(name: 'プリン').id,
			image: File.open("#{Rails.root}/app/assets/images/pudding-min.jpg")
		},
		{
			name: 'プリン4',
			caption: 'testtest',
			price: 300,
			category_id: Category.find_by(name: 'プリン').id,
			image: File.open("#{Rails.root}/app/assets/images/pudding-min.jpg")
		},
		{
			name: 'プリン5',
			caption: 'testtest',
			price: 300,
			category_id: Category.find_by(name: 'プリン').id,
			image: File.open("#{Rails.root}/app/assets/images/pudding-min.jpg")
		},
		{
			name: '焼き菓子1',
			caption: 'testtest',
			price: 400,
			category_id: Category.find_by(name: '焼き菓子').id,
			image: File.open("#{Rails.root}/app/assets/images/baked-min.jpg")
		},
		{
			name: '焼き菓子2',
			caption: 'testtest',
			price: 400,
			category_id: Category.find_by(name: '焼き菓子').id,
			image: File.open("#{Rails.root}/app/assets/images/baked-min.jpg")
		},
		{
			name: '焼き菓子3',
			caption: 'testtest',
			price: 400,
			category_id: Category.find_by(name: '焼き菓子').id,
			image: File.open("#{Rails.root}/app/assets/images/baked-min.jpg")
		},
		{
			name: '焼き菓子4',
			caption: 'testtest',
			price: 400,
			category_id: Category.find_by(name: '焼き菓子').id,
			image: File.open("#{Rails.root}/app/assets/images/baked-min.jpg")
		},
		{
			name: '焼き菓子5',
			caption: 'testtest',
			price: 400,
			category_id: Category.find_by(name: '焼き菓子').id,
			image: File.open("#{Rails.root}/app/assets/images/baked-min.jpg")
		},
		{
			name: 'キャンディ1',
			caption: 'testtest',
			price: 200,
			category_id: Category.find_by(name: 'キャンディ').id,
			image: File.open("#{Rails.root}/app/assets/images/candy-min.jpg")
		},
		{
			name: 'キャンディ2',
			caption: 'testtest',
			price: 200,
			category_id: Category.find_by(name: 'キャンディ').id,
			image: File.open("#{Rails.root}/app/assets/images/candy-min.jpg")
		},
		{
			name: 'キャンディ3',
			caption: 'testtest',
			price: 200,
			category_id: Category.find_by(name: 'キャンディ').id,
			image: File.open("#{Rails.root}/app/assets/images/candy-min.jpg")
		},
		{
			name: 'キャンディ4',
			caption: 'testtest',
			price: 200,
			category_id: Category.find_by(name: 'キャンディ').id,
			image: File.open("#{Rails.root}/app/assets/images/candy-min.jpg")
		},
		{
			name: 'キャンディ5',
			caption: 'testtest',
			price: 200,
			category_id: Category.find_by(name: 'キャンディ').id,
			image: File.open("#{Rails.root}/app/assets/images/candy-min.jpg")
		}
	]
)

p 'finish items create'
p 'start admin create'

Admin.create!(
	[
		{
			email: 'admin@a.com',
			password: '111111'
		}
	]
)

p 'finish admin create'
