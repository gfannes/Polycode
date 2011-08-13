#include "HelloPolycodeApp.h"

HelloPolycodeApp::HelloPolycodeApp(PolycodeView *view) {

#ifdef __APPLE__
	core = new CocoaCore(view, 640,480,false,0,90);	  
#else
	core = new SDLCore(view, 640,480,false,0,90);	  
#endif

	CoreServices::getInstance()->getResourceManager()->addArchive("default.pak");
	CoreServices::getInstance()->getResourceManager()->addDirResource("default", false);

	scene = new CollisionScene();

	ScenePrimitive *ground = new ScenePrimitive(ScenePrimitive::TYPE_PLANE, 10, 10);
	ground->loadTexture("green_texture.png");
	scene->addEntity(ground);

	box = new ScenePrimitive(ScenePrimitive::TYPE_BOX, 0.5,0.5,0.5);
	box->loadTexture("pink_texture.png");
	box->setPosition(0,1,0);
	scene->addCollisionChild(box, CollisionSceneEntity::SHAPE_BOX);

	bigBox = new ScenePrimitive(ScenePrimitive::TYPE_BOX, 2,2,2);
	bigBox->loadTexture("pink_texture.png");
	bigBox->setColor(0.0,1.0,1.0,0.5);
	bigBox->setPosition(0,1,0);
	scene->addCollisionChild(bigBox, CollisionSceneEntity::SHAPE_BOX);

	
	scene->getDefaultCamera()->setPosition(7,7,7);
	scene->getDefaultCamera()->lookAt(Vector3(0,0,0));
	
	swingValue = 0;
}

bool HelloPolycodeApp::Update() {
	Number elapsed = core->getElapsed();
	swingValue += elapsed;
	box->setPosition(sin(swingValue) * 5,1,0);	
	
	CollisionResult res = scene->testCollision(box, bigBox);
	if(res.collided) {
		bigBox->setColor(1.0,1.0,0.0,0.5);		
	} else {
		bigBox->setColor(0.0,1.0,1.0,0.5);	
	}
	
    return core->Update();
}
