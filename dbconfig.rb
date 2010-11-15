ActiveRecord::Base.establish_connection(
  :adapter => "mysql",
  :host => "localhost",
  :username => "root",            # maybe you need a pw, too...
  :database => "facebook_crawler",            
  :socket => '/tmp/mysql.sock',   # needed for OS X
  :encoding => 'utf8'
  #:pool=> 15                      # make sure it's higher than your thread nr
)


module MyConf
  ATOKEN = "2227470867|2.Ntl_JQBjYVR9usOjn4rFfg__.3600.1289811600-734710390|UAIf_4XNSMgDedbmOwjQHhhcZKg" #ren
  CURRENT_USER_ID =  734710390 #ren
end
