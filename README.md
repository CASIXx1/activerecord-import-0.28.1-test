# sample project for issue 579

I reproduced errors about  
https://github.com/zdennis/activerecord-import/issues/579

Validation is excuted when Book model bulk_import!.  
But, Validation is not excuted correctly when Book2 model bulk_import!

Run Rspec and check it out.  

`bundle exec rspec spec/models`
