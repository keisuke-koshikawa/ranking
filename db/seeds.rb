ActiveRecord::Base.transaction do
  # 会社
  company = Company.create!(name: "日本株式会社")

  puts "successed create #{company.name}"

  # 役職
  position_0 = Position.create!(company: company, name: '本部長')
  position_1 = Position.create!(company: company, name: '支店長')
  position_2 = Position.create!(company: company, name: '課長')
  position_3 = Position.create!(company: company, name: '係長')
  position_4 = Position.create!(company: company, name: '一般社員')

  puts "successed create positions"

  # 部
  department_1 = Department.create!(company: company, name: "北海道営業部")
  department_2 = Department.create!(company: company, name: "東北営業部")
  department_3 = Department.create!(company: company, name: "関東営業部")
  department_4 = Department.create!(company: company, name: "北陸営業部")
  department_5 = Department.create!(company: company, name: "近畿営業部")
  department_6 = Department.create!(company: company, name: "四国営業部")
  department_7 = Department.create!(company: company, name: "中国営業部")
  department_8 = Department.create!(company: company, name: "九州沖縄営業部")

  puts "successed create root departments"

  # 部署・支店
  ## 北海道
  department_1_1 = department_1.children.create!(company: company, name: "札幌支店")
  department_1_2 = department_1.children.create!(company: company, name: "函館支店")
  department_1_3 = department_1.children.create!(company: company, name: "旭川支店")

  ## 東北
  department_2_1 = department_2.children.create!(company: company, name: "宮城支店")
  department_2_2 = department_2.children.create!(company: company, name: "秋田支店")
  department_2_3 = department_2.children.create!(company: company, name: "福島支店")

  ## 関東
  department_3_1 = department_3.children.create!(company: company, name: "埼玉支店")
  department_3_2 = department_3.children.create!(company: company, name: "千葉支店")
  department_3_3 = department_3.children.create!(company: company, name: "東京支店")

  ## 北陸
  department_4_1 = department_4.children.create!(company: company, name: "山形支店")
  department_4_2 = department_4.children.create!(company: company, name: "新潟支店")
  department_4_3 = department_4.children.create!(company: company, name: "富山支店")

  ## 近畿
  department_5_1 = department_5.children.create!(company: company, name: "大阪支店")
  department_5_2 = department_5.children.create!(company: company, name: "兵庫支店")
  department_5_3 = department_5.children.create!(company: company, name: "京都支店")

  ## 四国
  department_6_1 = department_6.children.create!(company: company, name: "徳島支店")
  department_6_2 = department_6.children.create!(company: company, name: "高知支店")
  department_6_3 = department_6.children.create!(company: company, name: "香川支店")

  ## 中国
  department_7_1 = department_7.children.create!(company: company, name: "鳥取支店")
  department_7_2 = department_7.children.create!(company: company, name: "島根支店")
  department_7_3 = department_7.children.create!(company: company, name: "山口支店")

  ## 九州沖縄
  department_8_1 = department_8.children.create!(company: company, name: "福岡支店")
  department_8_2 = department_8.children.create!(company: company, name: "鹿児島支店")
  department_8_3 = department_8.children.create!(company: company, name: "沖縄支店")

  puts "successed create child departments"

  ROOT_DEPARTMENT = [
    "北海道営業部",
    "東北営業部",
    "関東営業部",
    "北陸営業部",
    "近畿営業部",
    "四国営業部",
    "中国営業部",
    "九州沖縄営業部"
  ]

  # 社員
  Department.all.each do |department|

    # 本部長データの作成(本部長は売り上げを持たない)
    if ROOT_DEPARTMENT.include?(department.name)
      gimei = Gimei.name
      sex = [:male, :female].sample
      gimei =
        if sex == :male
          Gimei.male
        else
          Gimei.female
        end
      Employee.create!(
        company: company,
        position: position_0,
        department: department,
        last_name: gimei.last.kanji,
        first_name: gimei.first.kanji,
        last_name_kana: gimei.last.katakana,
        first_name_kana: gimei.first.katakana,
        sex: sex,
        hired_at: Faker::Date.between(from: '1990-04-01', to: '2000-04-01')
      )
      puts "successed create #{department.name} account"
      next
    end

    # 支店長以下の役職のデータを作成
    4.times do |i|
      i += 1
      position =
        case i
        when 1
          position_1
        when 2
          position_2
        when 3
          position_3
        when 4
          position_4
        end
      gimei = Gimei.name
      sex = [:male, :female].sample
      gimei =
        if sex == :male
          Gimei.male
        else
          Gimei.female
        end
      employee = Employee.create!(
        company: company,
        position: position,
        department: department,
        last_name: gimei.last.kanji,
        first_name: gimei.first.kanji,
        last_name_kana: gimei.last.katakana,
        first_name_kana: gimei.first.katakana,
        sex: sex,
        hired_at: Faker::Date.between(from: '2005-04-01', to: '2018-04-01')
      )

      puts "successed create #{department.name} account" if i == 4

      # 売り上げデータの作成
      30.times do |i|
        i += 1

        Order.create!(
          customer_name: Faker::Company.name,
          employee: employee,
          company: company,
          department: department,
          price: "#{rand(10) + 1}000000".to_i,
          status: Order.statuses.keys.sample,
          ordered_at: Faker::Date.between(from: '2018-07-01', to: '2021-04-01')
        )

        puts "successed create order" if i == 30
      end
    end
  end
end