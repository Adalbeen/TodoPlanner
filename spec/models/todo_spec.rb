require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'validation tests' do
    it 'ensures text presence' do
      todo = Todo.new(check: false, DateOfCreation: Time.now, owner: 'voj.proch@gmail.com').save
      expect(todo).to eq(false)
    end

    it 'should save successfully' do
      todo = Todo.new(text: 'test123', check: false, DateOfCreation: Time.now, owner: 'voj.proch@gmail.com').save
      expect(todo).to eq(true)
    end

  end
  context 'scope tests' do
    let (:params) { {text: 'test123', check: false, DateOfCreation: Time.now} }
    before(:each) do
      Todo.new(params).save
      Todo.new(params.merge(owner: 'voj.proch@gmail.com')).save
      Todo.new(params.merge(owner: 'voj.proch@gmail.com')).save
      Todo.new(params).save
      Todo.new(params).save
    end


    it 'should return active' do
      expect(Todo.right_user.size).to eq(2)
    end

  end
end
