Rails.application.routes.draw do

  get 'annexes/video', as: :Video

  get 'annexes/self_assessment', as: :SelfAssessment

  get 'annexes/engineering_report', as: :EngineeringReport

  get 'annexes/generated_code', as: :GeneratedCode

  get 'attachments/attachment1', as: :attachment1

  get 'attachments/attachment2', as: :attachment2

  get 'attachments/attachment3', as: :attachment3

  get 'attachments/attachment4', as: :attachment4

  root 'home#index'

end
