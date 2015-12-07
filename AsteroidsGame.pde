SpaceShip af1;
Star [] sky;
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;
double accel = .2;
ArrayList <Asteroid> rock;
ArrayList <Bullet> shot;
public void setup() 
{
  size(600,600);
  af1=new SpaceShip();
  sky = new Star [200];
  rock = new ArrayList <Asteroid>();
  shot = new ArrayList <Bullet>();
  for(int i=0;i<sky.length;i++)
  {
    sky[i]=new Star();
  }
  for(int i=0;i<16;i++)
  {
    rock.add (new Asteroid());
    shot.add (new Bullet(af1));
  }
}
public void draw() 
{
  background(50);
  af1.show();
  af1.move();
  af1.controls();
  for(int i=0;i<sky.length;i++)
  {
    sky[i].show();
  }
  for(int i=0;i<rock.size();i++)
  {
    rock.get(i).show();
    rock.get(i).move();
    if(dist((float)rock.get(i).getX(),(float)rock.get(i).getY(),(float)af1.getX(),(float)af1.getY())<20)
      {
        rock.remove(i);
      }
  }
  for(int i=0;i<shot.size();i++)
  {
    shot.get(i).show();
    shot.get(i).move();
  }
}
/*
public void keyPressed()
{
  if (keyCode==UP)
  {
    af1.accelerate(accel);
  }
  if (keyCode==DOWN)
  {
    af1.accelerate(-accel);
  }
  if (keyCode==LEFT)
  {
    af1.rotate(-5);
  }
  if (keyCode==RIGHT)
  {
    af1.rotate(5);
  }
}*/
public void keyPressed()
{
  if(keyCode == LEFT)
  {
    left = true;
  }
  if (keyCode == RIGHT)
  {
    right = true;
  }
  if(keyCode == UP)
  {
    up = true;
  }
  if (keyCode == DOWN)
  {
    down = true;
  }
}
public void keyReleased() 
{
  if(keyCode == LEFT)
  {
    left = false;  
  }
  if(keyCode == RIGHT)
  {
    right = false;
  }
  if(keyCode == UP)
  {
    up = false;
  }
  if (keyCode == DOWN)
  {
    down = false;
  }
}
public void keyTyped()
{
  if(key == 'h')
  {
     af1.setDirectionX(0);
     af1.setDirectionY(0);
     af1.setX((int)(Math.random()*600));
     af1.setY((int)(Math.random()*600));
     af1.setPointDirection((int)(Math.random()*360));
  }
}
class SpaceShip extends Floater  
{ 
  public SpaceShip()
  {
    corners=10;
    int[] xS = {-11,-2,4,4,22,4,4,-2,-11,-5};
    int[] yS = {-9,-6,-11,-4,0,4,11,6,9,0};
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX=300;
    myCenterY=300;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }  
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}    
  public double getDirectionX(){return myDirectionX;}  
  public void setDirectionY(double y){myDirectionY=y;}    
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection=degrees;}  
  public double getPointDirection(){return myPointDirection;}
  public void controls()
  {
  if(left == true)
  {
    af1.rotate(-5);    
  }
  if(right == true)
  {
    af1.rotate(5);
  }
  if(up == true)
  {
    af1.accelerate(accel);
  }
  if(down == true)
  {
    af1.accelerate(-accel);
  }
}
  } 
 /* public void show()
    {
      if (keyCode==UP)
      {
        int xLineRotatedTranslated, xLineRotatedTranslated; linex1, liney1, linex2, liney2
        int [] speedline}
        xLineRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
        yLineRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY); 
      }
    }*/
class Bullet extends Floater
{
  private double dRadians ;
  public Bullet(SpaceShip theShip)
  {
    myCenterX=theShip.getX();
    myCenterY=theShip.getY();
    myPointDirection=theShip.getPointDirection();
    myDirectionX=theShip.getDirectionX();
    myDirectionY=theShip.getDirectionY();
    myColor = 255;
    dRadians=myPointDirection*(Math.PI/180);
  }
  public void show()
  {
    fill(myColor);
    ellipse((float)myCenterX,(float)myCenterY,5,5);
  }
    public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}    
  public double getDirectionX(){return myDirectionX;}  
  public void setDirectionY(double y){myDirectionY=y;}    
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection=degrees;}  
  public double getPointDirection(){return myPointDirection;}
}
class Asteroid extends Floater
{
  private int rotationSpeed;
    public Asteroid()
  {
    corners=6;
    int[] xS = {20,10,-10,-20,-10,10};
    int[] yS = {0,-17,-17,0,17,17};
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX=Math.random()*601;
    myCenterY=Math.random()*601;
    myDirectionX=(Math.random()*7-3);
    myDirectionY=(Math.random()*7-3);
    myPointDirection=(int)(Math.random()*360);
    rotationSpeed=(int)(Math.random()*12-5);
  }  
  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}    
  public double getDirectionX(){return myDirectionX;}  
  public void setDirectionY(double y){myDirectionY=y;}    
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection=degrees;}  
  public double getPointDirection(){return myPointDirection;} 
  public void move()
{
  rotate(rotationSpeed);

  super.move();
}
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Star
{
    private int myX, myY;
    private color starColor;
  public Star()
  {
    myX=(int)(Math.random()*600);
    myY=(int)(Math.random()*600);
    starColor = color(255);
  }
  public void show()
  {
    fill(starColor);
    ellipse(myX, myY, 3, 3);
  }
}
