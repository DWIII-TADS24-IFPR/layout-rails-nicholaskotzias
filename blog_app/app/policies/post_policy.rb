class PostPolicy < ApplicationPolicy
  def index?
    true # qualquer usuário pode listar posts
  end
  def show?
    true # qualquer usuário pode ver um post
  end

  def create?
    user.present? # apenas usuários logados podem criar
  end

  def update?
    user.present? && record.user_id == user.id # só o dono do post
  end

  def destroy?
    user.present? && record.user_id == user.id # só o dono do post
  end
end