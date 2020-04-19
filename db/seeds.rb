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
			price: 10000,
			category_id: Category.find_by(name: 'ケーキ').id,
			image: File.open("#{Rails.root}/public/images/sample.png")
		},
		{
			name: 'ケーキ2',
			caption: 'testtest',
			price: 10000,
			category_id: Category.find_by(name: 'ケーキ').id,
			image: File.open("#{Rails.root}/public/images/sample.png")
		},
		{
			name: 'ケーキ3',
			caption: 'testtest',
			price: 10000,
			category_id: Category.find_by(name: 'ケーキ').id,
			image: File.open("#{Rails.root}/public/images/sample.png")
		},
		{
			name: 'ケーキ4',
			caption: 'testtest',
			price: 10000,
			category_id: Category.find_by(name: 'ケーキ').id,
			image: File.open("#{Rails.root}/public/images/sample.png")
		},
		{
			name: 'プリン1',
			caption: 'testtest',
			price: 10000,
			category_id: Category.find_by(name: 'プリン').id,
			image: File.open("#{Rails.root}/public/images/sample.png")
		},
		{
			name: 'プリン2',
			caption: 'testtest',
			price: 10000,
			category_id: Category.find_by(name: 'プリン').id,
			image: File.open("#{Rails.root}/public/images/sample.png")
		},
		{
			name: '焼き菓子1',
			caption: 'testtest',
			price: 10000,
			category_id: Category.find_by(name: '焼き菓子').id,
			image: File.open("#{Rails.root}/public/images/sample.png")
		},
		{
			name: 'キャンディ1',
			caption: 'testtest',
			price: 10000,
			category_id: Category.find_by(name: 'キャンディ').id,
			image: File.open("#{Rails.root}/public/images/sample.png")
		}
	]
)

p 'finish items create'