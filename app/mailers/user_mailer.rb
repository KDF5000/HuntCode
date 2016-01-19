class UserMailer < ApplicationMailer
  default from: "843951034@qq.com"

  def send_mail(projects, mail, content, host)
    @projects = projects
    @host = "http://" + host
    if projects.nil?
      @projects = []
    end
    mail(to: mail,subject: content)
  end
end
