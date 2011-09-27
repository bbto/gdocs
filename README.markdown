gdocs gem
===

gdocs gem, is a wrapper for Google Doc's service. 

    | gdocs
    |   base.rb
    |   sheets.rb - listar y consultar sheets.
    |   |  list()
    |   |  get(id)
    |   sheet.rb
    |   |  actions that modify or add information to a particular sheet.

Example usage
====  
    @gd = Gdocs::Base.new(attributes)
    @gd.list() #=> a list of spreasheets
    

Creating
====