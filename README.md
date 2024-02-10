# News-Api-Integration

Integrating News API with Salesforce and enabling searching for news in multiple languages

## Features built in this project

- News API Integration with salesforce
- Search for specific news
- Find news that is **relevant** to your search
- Find news that is **popular**
- Find news that is **latest**
- Search for news in **13 International Languages**

### Create an News API developer account and generate API key

- In your browser, navigate to this link [https://newsapi.org/](https://newsapi.org/)
- Sign up for a developer account, and get the api key.

### Add the site to Remote Site Settings

- Navigate to setup of your developer org, now in in quick find box, search for Remote Site settings.
- Create a new Remote Site, enter the name of the remote site
- Enter the news Api endpoint in the Remote Site URL section or copy this url **https://newsapi.org**
- Now save the remote site.

### Let's run this in a salesforce org!

- First open your developer org and, navigate to developer console.
- Now create a new apex class with **newsIntegration** name
- Copy the apex code in the newly created apex class.
- Now replace the api key with your API key in the **generateEndpoint** method **apiKey=<replace me>**
- After creating the apex class lets setup the visualforce page
- In your developer console, create a new Visualforce page with any name you want!
- Copy the visualforce code in the newly created visualforce page.

### Deploy the page as a Visualforce Tab

- Navigate to the setup of your org and, in the **Quick Find** search bar type **tabs**
- In the Visualforce Tabs section under Tabs, click **new**, this will open a new screen to create a visualforce tab.
- Select the visualforce page you just created in the developer console, name your Visualforce Tab and select tab style, then click next.
- Select the profiles you want the visualforce tab to be visible to, after selecting the profles click next.
- Select the solutions to which you want the tab to be visible for, then click Save.
- Navigate to the solution on which you've enabled the Visualforce tab.

### Demonstration
