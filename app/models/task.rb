class Task < ApplicationRecord
    validates:item, presence: {message:'文字を入力してください'}, length:{maximum:30, message:'30文字以内で入力してください'}
    validates:status, presence: {message:'ステータスを選択してください'}
    validates:deadline, presence:{message:'日付を入力してください'}
end
