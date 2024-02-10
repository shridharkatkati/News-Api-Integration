public class newsIntegration {
    public List<Map<String,String>> usefulArticlesFields {get;set;}
    public String query {set;get;}
    public String sortBy {set;get;}
    public String language {set;get;}

// =========================================================================================================    
    public String generateEndpoint(){
        String endpoint = 'https://newsapi.org/v2/everything?apiKey=53eca3d4ac7c4482b97f064697b7c950';
        if(String.isNotBlank(query)) endpoint = endpoint +'&q=' + query +'&sortBy='+ sortBy +'&language='+ language;
        if(String.isBlank(query)) endpoint = endpoint +'&q=keyword'+'&sortBy='+ sortBy +'&language='+ language;
        System.debug(endpoint);
        return endpoint;
    }
    
    public void searchQuery(){ // command button action function
        system.debug(query);
        String endpoint = generateEndpoint();
        String strResponse;
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HTTPResponse response = new HTTPResponse();
        
        try {
            response = http.send(request);
            if (response.getStatusCode() == 200){
                strResponse = response.getBody();
            } else {
                throw new CalloutException(response.getBody());
            }
        } catch(Exception e) {
            throw e;
        }

        if(!String.isBlank(strResponse)) {
            deserialiseJSONResponseToAMap(strResponse);
        }
    }

    
    
    public void deserialiseJSONResponseToAMap(String strResponse){
        Map<String,Object> mapResponse = (Map<String,Object>) JSON.deserializeUntyped(strResponse);
            List<Object> articlesList = (List<Object>) mapResponse.get('articles'); 
            usefulArticlesFields = new List<Map<String,String>>(); // Initialize the class-level variable

            for(Object article : articlesList){
                Map<String,String> nMap = new Map<String,String>();
                String jsonArticle = JSON.serialize(article,True);
                System.JSONParser parser = JSON.createParser(jsonArticle);

                while(parser.nextToken() != null){
                    if(parser.getText() == 'author'){
                        parser.nextToken();
                        nMap.put('author',parser.getText());
                    }
                    if(parser.getText() == 'title'){
                        parser.nextToken();
                        nMap.put('title',parser.getText());
                    }
                    if(parser.getText() == 'description'){
                        parser.nextToken();
                        nMap.put('description',parser.getText());
                    }
                    if(parser.getText() == 'url'){
                        parser.nextToken();
                        nMap.put('url',parser.getText());
                    }
                    if(parser.getText() == 'urlToImage'){
                        parser.nextToken();
                        nMap.put('urlToImage',parser.getText());
                    }
                    if(parser.getText() == 'publishedAt'){
                        parser.nextToken();
                        nMap.put('publishedAt',parser.getText());
                    }
                    if(parser.getText() == 'content'){
                        parser.nextToken();
                        nMap.put('content',parser.getText());
                    }
                }
                usefulArticlesFields.add(nMap);
            }
    } 
}