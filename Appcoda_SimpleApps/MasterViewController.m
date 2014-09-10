//
//  MasterViewController.m
//  Appcoda_SimpleApps
//
//  Created by chengzhang on 9/6/14.
//  Copyright (c) 2014 chengzhang. All rights reserved.
//
#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSXMLParser *parser;        //will download and parse the RSS XML files
    NSMutableArray *feeds;      //contain the list of feeds downloaded
    //itme will contains the details of a feed, in our case its title and its link; and finally
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;      //help us to control with element is currently parsing the NSXMLParser object
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    feeds = [[NSMutableArray alloc] init];
    //this is the url that we can get rss
    NSURL *url = [NSURL URLWithString:@"http://images.apple.com/main/rss/hotnews/hotnews.rss"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];     //start to parse, it is event-driven
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    return cell;
}

#pragma mark - NSXMLDelegate
//Whenever the parser finds a new element, it calls the didStartElement method from its delegate
//In that method we have to check that the element found is an “item”, and if so, we allocate the variables to store the item.
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;
    if ([element isEqualToString:@"item"]){
        item = [[NSMutableDictionary alloc] init];
        title = [[NSMutableString alloc] init];
        link = [[NSMutableString alloc] init];
    }
}

/*the parser calls its delegate every time new characters are found. This is why we have to use mutable strings, since we have to add the new characters found to the previous ones. In our case we are interested in the “title” and “link” elements, but we could also store information about the “date” or “summary” of the story */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([element isEqualToString:@"title"]){
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]){
        [link appendString:string];
    }
}

/*When the parser encounters the end of an element, it calls the didEndElement method. In that case we simply add the new object to the array of objects. */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"]){
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        
        [feeds addObject:[item copy]];
    }
}

/*when the parser encounters the end of the document, it calls the method parserDidEndDocument. In that case what we have to do is to inform to the UITableView to redisplay itself, since we have all the data to be displayed */
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *linkedURL = [[feeds objectAtIndex:indexPath.row] valueForKey:@"link"];
        [segue.destinationViewController setUrl:linkedURL];
        //equal to segue.destinationViewController.url = linkedURL
    }
}


@end
