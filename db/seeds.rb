# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Criterium.delete_all
Criterium.reset_sequence_name
Criterium.create([
                {name: "Новизна", id: 1},
                {name: "Значимость ислледования для науки", id:2},
                {name: "Глубина проработки", id:3}
            ])

Assessment.delete_all
Assessment.reset_sequence_name
Assessment.create([
                     {id:3, name: "Уже было проведено исследование (дублирование)", criteria_id:1,rang:""},
                     {id:2, name: "Есть аналоги (работа отличается незначительно)", criteria_id:1,rang:""},
                     {id:1, name: "Совершенно новое исследование", criteria_id:1,rang:""},
                     {id:6, name: "Нет влияния на научное сообщество", criteria_id:2,rang:""},
                     {id:5, name: "Исследование незначительно повлияет на научное сообщество", criteria_id:2,rang:""},
                     {id:4, name: "Исследование имеет значительное влияние на научное сообщество", criteria_id:2,rang:""},
                     {id:9, name: "На уровне обзора", criteria_id:3,rang:""},
                     {id:8, name: "Проработанная статья", criteria_id:3,rang:""},
                     {id:7, name: "На уровне диссертации", criteria_id:3,rang:""},
])
University.delete_all
University.reset_sequence_name
University.create([
                      {name: "Санкт-Петербургский политехнический университет Петра Великого", id: 1},
                      {name: "Санкт-Петербургский государственный университет", id: 2},
                      {name: "Санкт-Петербургский государственный институт культуры", id: 3},
                  ])
Nir.delete_all
Nir.reset_sequence_name
Nir.create([
                      {name: "Применение динамического расчета локальных скоростей ленты конвейера как входного параметра РСУ: выпускная квалификационная работа магистра: 09.04.01 - Информатика и вычислительная техника ; 09.04.01_17 - Интеллектуальные системы (международная образовательная программа на иностранном языке)",
                       id: 1, assessment1_id:1, assessment2_id:4, assessment3_id:7, v:"",university_id:1},
                      {name: "IT projects feasibility assessment as an alternative to economic efficiency assessment // Научно-технические ведомости Санкт-Петербургского государственного политехнического университета. Сер. : Экономические науки: научное издание. – 2015. – № 5 (228)",
                       id: 2, assessment1_id:3, assessment2_id:5, assessment3_id:8, v:"",university_id:1},
                      {name: "Метод анализа IT-инфраструктуры распределённого (сетевого ресторанного) предприятия: выпускная квалификационная работа магистра: 09.04.03 - Прикладная информатика ; 09.04.03_06 - Технологии веб-разработки",
                       id: 3, assessment1_id:2, assessment2_id:5, assessment3_id:8, v:"",university_id:1},
                      {name: "Анализ развития IT-аутсорсинга в России // XXXVI неделя науки СПбГПУ: материалы Всероссийской межвуз. науч.-техн. конф. студентов и аспирантов, 26 ноября - 1 декабря 2007 г. Санкт-Петербург. – 2009. – Международная высшая школа управления",
                       id: 4, assessment1_id:1, assessment2_id:4, assessment3_id:7, v:"",university_id:1},
                      {name: "Using economic and mathematical models and methods to assess the human capital of a company in the field of IT industry // St. Petersburg state polytechnical university journal. Economics. – 2017. – Vol. 10, № 2",
                       id: 5, assessment1_id:3, assessment2_id:6, assessment3_id:9, v:"",university_id:1},
                      {name: "Разработка комплексного дизайн решения для IT-компании IOKY: выпускная квалификационная работа бакалавра: 54.03.01 - Дизайн ; 54.03.01_02 - Графический дизайн",
                       id: 6, assessment1_id:1, assessment2_id:6, assessment3_id:8, v:"",university_id:1},
                      {name: "Проект внедрения системы управления проектами на малом IT-предприятии: выпускная квалификационная работа бакалавра: 27.03.05 - Инноватика ; 27.03.05_01 - Управление инновациями (по отраслям и сферам экономики)",
                       id: 7, assessment1_id:2, assessment2_id:6, assessment3_id:9, v:"",university_id:2},
                      {name: "Chinese economic miracle // Материалы... 29 ноября- 4 декабря 2004 г. – 2005. – Институт международных образовательных программ",
                       id: 8, assessment1_id:1, assessment2_id:6, assessment3_id:8, v:"",university_id:2},
                      {name: "Идиомы в разговорном английском : цветные идиомы // Материалы... 29 ноября- 4 декабря 2004 г. – 2005. – Гуманитарный факультет. Юридический факультет",
                       id: 9, assessment1_id:2, assessment2_id:6, assessment3_id:7, v:"",university_id:2},
                      {name: "Феномен сленга кокни // Материалы... 29 ноября- 4 декабря 2004 г. – 2005. – Гуманитарный факультет. Юридический факультет",
                       id: 10, assessment1_id:3, assessment2_id:4, assessment3_id:7, v:"",university_id:2},
                      {name: "Культура как фактор, влияющий на сознание // XXXIV неделя науки: материалы Всероссийской межвузовской научно-технической конференции студентов и аспирантов: 28 ноября - 3 декабря 2005 г. – 2006. – Факультет иностранных языков",
                       id: 11, assessment1_id:1, assessment2_id:4, assessment3_id:9, v:"",university_id:3},
                      {name: "Difficulties of intercultural business communucation // Материалы...24 - 29 ноября 2003г. – Институт международных образовательных программ",
                       id: 12, assessment1_id:1, assessment2_id:6, assessment3_id:9, v:"",university_id:3},
                      {name: "Организационная культура как инструмент развития предприятия (на примере корпорации Carpoly): магистерская диссертация: 38.04.02",
                       id: 13, assessment1_id:3, assessment2_id:6, assessment3_id:7, v:"",university_id:3},
                      {name: "Культурный шок // XXXIV неделя науки: материалы Всероссийской межвузовской научно-технической конференции студентов и аспирантов: 28 ноября - 3 декабря 2005 г. – 2006. – Факультет иностранных языков",
                       id: 14, assessment1_id:2, assessment2_id:6, assessment3_id:8, v:"",university_id:3},
                      {name: "Межкультурная коммуникация на пути к успеху // Материалы... 29 ноября- 4 декабря 2004 г. – 2005. – Гуманитарный факультет. Юридический факультет",
                       id: 15, assessment1_id:2, assessment2_id:5, assessment3_id:7, v:"",university_id:3},
                  ])
TwoCriterium.delete_all
TwoCriterium.reset_sequence_name
TwoCriterium.create([
    {criteria1_id:1,criteria2_id:2, uses:false},
    {criteria1_id:1,criteria2_id:3, uses:false},
    {criteria1_id:2,criteria2_id:3, uses:false},
           ])