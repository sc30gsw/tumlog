class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: "--" }
    { id: 2, name: "運動" }
    { id: 3, name: "ダイエット(体重管理)" }
    { id: 4, name: "勉強" }
    { id: 5, name: "節約" }
    { id: 6, name: "マインドフルネス瞑想" }
  ]

  include AcitiveHash::Associations 
  has_many :rooms

end
